# Gerekli k??t??phaneleri y??kle (Machine learning ve veri analizi i??in)
library(party)    # Ko??ullu ????kar??m a??a??lar?? i??in geli??mi?? k??t??phane
library(rpart)    # Klasik karar a??ac?? algoritmalar?? i??in k??t??phane
library(caret)    # Model e??itimi ve de??erlendirmesi i??in destek k??t??phanesi
library(C50)
library(rpart.plot)
library(e1071)
library(dplyr)
# Load the dataset
data <- read.csv("C:/Users/cagri/OneDrive/Belgeler/bank.csv", sep=";", header=TRUE)

summary(data)
# Kategorik de??i??kenleri fakt??re ??evir (Makine ????renmesi modellerinde gerekli)
data$job <- as.factor(data$job)           # Meslek bilgisini fakt??re ??evir
data$marital <- as.factor(data$marital)   # Medeni durum bilgisini fakt??re ??evir
data$education <- as.factor(data$education)  # E??itim durumunu fakt??re ??evir
data$default <- as.factor(data$default)   # Varsay??lan durum bilgisini fakt??re ??evir
data$housing <- as.factor(data$housing)   # Konut bilgisini fakt??re ??evir
data$loan <- as.factor(data$loan)         # Kredi bilgisini fakt??re ??evir
data$contact <- as.factor(data$contact)   # ??leti??im bilgisini fakt??re ??evir
data$month <- as.factor(data$month)       # Ay bilgisini fakt??re ??evir
data$poutcome <- as.factor(data$poutcome) # ??nceki sonu?? bilgisini fakt??re ??evir
data$y <- as.factor(data$y)               # Hedef de??i??keni fakt??re ??evir

data<-data%>%mutate(across(where(is.character),as.factor))


# Veri setini e??itim ve test olarak b??l
set.seed(42)  # Rastgele b??lme i??lemi i??in sabit tohum de??eri belirle
# Veri setinin %60'??n?? e??itim verisi olarak se??
train_indices <- sample(1:nrow(data), size = 0.6 * nrow(data))  
train_data <- data[train_indices, ]   # E??itim verilerini olu??tur
test_data <- data[-train_indices, ]   # Geri kalan verileri test verisi olarak ay??r

# ??ki farkl?? karar a??ac?? modeli e??it
# Ctree (??statistiksel testli karar a??ac??)
ctree_model <- ctree(y ~ ., data = train_data)  
ctree_pred <- predict(ctree_model, newdata = test_data)  # Ctree modeliyle tahmin,
ctree_conf <- table(Actual = test_data$y, Predicted = ctree_pred)  # Ctree i??in kar??????kl??k matrisi

plot(ctree_model)
ctree_cm<-confusionMatrix(ctree_pred,test_data$y)


summary(train_data)
# Rpart (Klasik karar a??ac??)
rpart_model <- rpart(y ~ ., data = train_data)

# Her iki model ile tahminleme yap



rpart_pred <- predict(rpart_model, newdata = test_data, type = "class")  # Rpart modeliyle tahmin

# Kar??????kl??k matrisleri olu??tur (Model performans??n?? de??erlendirmek i??in)

rpart_conf <- table(Actual = test_data$y, Predicted = rpart_pred)  # Rpart i??in kar??????kl??k matrisi
rpart_cm<-confusionMatrix(rpart_pred,test_data$y)

rpart.plot(rpart_model)
c5_model<-C5.0(y ~ ., data = train_data)
c5_pred<-predict(c5_model, newdata = test_data)
C5_cm<-confusionMatrix(c5_pred,test_data$y)

plot(c5_model)



performance <- data.frame(
  Model = c("ctree", "rpart", "C5.0"),
  Accuracy = c(ctree_cm$overall["Accuracy"], rpart_cm$overall["Accuracy"], C5_cm$overall["Accuracy"]),
  Sensitivity = c(ctree_cm$byClass["Sensitivity"], rpart_cm$byClass["Sensitivity"], C5_cm$byClass["Sensitivity"]),
  Specificity = c(ctree_cm$byClass["Specificity"], rpart_cm$byClass["Specificity"], C5_cm$byClass["Specificity"])
)

# Performans?? Kar????la??t??rmak i??in Grafik
library(ggplot2)
performance_long <- reshape2::melt(performance, id.vars = "Model")
ggplot(performance_long, aes(x = Model, y = value, fill = variable)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Model Performans?? Kar????la??t??rmas??", y = "De??er", x = "Model") +
  theme_minimal()

