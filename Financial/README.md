# Financial

## Installation Packages
````
install.packages("tseries")
install.packages("fpp2")
install.packages("magrittr") # for piping in R
install.packages("astsa")
install.packages("scales")
install.packages("zoo")
install.packages("xts")
install.packages("quantmod")
````
## Outlines
- Introduction to Time Series Analysis
- Data Wrangling
- Trend Analysis (Linear Model)
- Autogressive Moving Average Model (ARMA)

## Time Series Analysis
### JJ (Johnson and Johnson)
````
> str(jj)
Time-Series [1:84] from 1960 to 1981:0.71 0.63 0.85 0.44 0.61 0.69 0.92 0.55 0.72 0.77 ...
````
````
plot(jj, type="o", ylab="Quarterly Earnings per Share")
````
<img src="https://github.com/safesit23/R-language/blob/master/Financial/plots/01_plot(jj).png" width="300" title="plot">
Non stationary because it is trends, season, variance

### NYSE
<img src="https://github.com/safesit23/R-language/blob/master/Financial/plots/02_plot(nyse).png" width="300" title="plot">

- Stationary
- No Trends
- No season
- มี special event (เรียกว่า pulse) เป็นเหตุการณ์ที่เรียกว่า market crash
