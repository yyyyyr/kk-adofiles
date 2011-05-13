$Id$
After a regression, predict with X1=0, X1=1, then calculate the difference

This is a post-estimation command.  
Suppose you have a dummy variable X. 
The program will: 
1. calculate model prediction with X
2. calculate model prediction with X = 0
3. calculate model prediction with X = 1
4. calculate difference between 3/4
5. return X to original state

arraytreatments option:
  calculate treatment effect on treated:
  where "untreated" is 0 for all variables in varlist
  treatment is the "actual" treatment.  
  I do not turn on treat=1 for the whole array


EXAMPLE
reg y x x2 z 
predict_toggle x , keep
predict_toggle x x2, keep
predict_toggle x x2, arraytreatments


	syntax varlist [if] [in] [fweight pweight aweight iweight] ///
		[, ARraytreatments /// turn all varlist vars off for untreated; not one at a time
		   Quietly         ///
		   svy /// prefix "mean ___ " with "svy:"
		   meanopts(string) /// options to pass to mean ___
		   Keep /// create a set of te_y variables for all varables (automatically on if only 1 variable)
		   PREFix(string) /// prefix te_* variables with this string
		   * /// other options passed to predict 
		]
		
		
By Keith Kranker
$Date$