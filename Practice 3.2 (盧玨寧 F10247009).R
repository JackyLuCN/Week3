before_diet= c(104, 95, 87, 77, 112)
after_diet= c(96,  91, 81, 75, 118)
subject= c('subject_1', 'subject_2', 'subject_3', 'subject_4', 'subject_5')

weight = data.frame(before_diet, after_diet)
rownames(weight)= subject

loss=c(weight$after_diet - weight$before_diet)
subject_num=c(1:5)
loss_table=data.frame(subject_num, loss)
colnames(loss_table)=c('subject','weight_loss')
loss_table

BUBBLE_DIET='R is a really helpful tool for me to analyze data'

WEIGHT_LOSS=c(subject, loss_table,  BUBBLE_DIET)
WEIGHT_LOSS
