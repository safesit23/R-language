alpha = 0.05
z.alpha = qnorm(alpha);
z.alpha #critical value
if(z.alpha<0){
  z.alpha = -z.alpha
  print("Test")
}
z.alpha

?prop.test
