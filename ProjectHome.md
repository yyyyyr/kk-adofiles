This code was migrated here from http://econweb.umd.edu/~kranker/code/
(where I hosted it when I was a grad student)




# Stata and Notepad++ #

I have posted my instructions for integrating Stata and Notepad++ as a separate project:

  * **[notepad-stats-integration](http://code.google.com/p/notepad-stats-integration/)**


# Stata Programs #

This project contains Stata .ado and .do files and other code I've written.
Among other programs, you'll find...

  * `did3         ` - Create difference-in-differences tables.
  * `mat2txt2     ` - Export matrix to text file.
  * `meantab      ` - `mean varlist`, with columns separated by a categorical variable.
  * `memmax       ` - Set memory to the maximum allowed by your operating system.
  * `motionshart  ` - Create graphs of your data, from Stata, as a [Google Motion Chart](http://code.google.com/apis/visualization/documentation/gallery/motionchart.html)
  * `normdiff     ` - Create a table to compare means of two groups, with a column containing normalized differences.
  * `predlog2     ` - Duan smearing & heteroscedastic smearing retransformation.
  * `predict_toggle` -  After a regression, predict with X1=0, X1=1, then calculate the difference
  * `pub2web` - Turn a list of your .ado packages into a "usersite" website
  * `xilabel` -  Quickly "clean up" variable labels for variables created by the [: ](xi.md) command

[Here is a full list](http://code.google.com/p/kk-adofiles/source/browse/stata.toc) of available packages.

**Access**

You can get to the programs three ways:
  1. (Recommended) If you have [Mercurial](http://code.google.com/p/support/wiki/GettingStarted#Working_with_your_Source_Repository) installed, use it to [checkout](http://code.google.com/p/kk-adofiles/source/checkout) this repository, then install the .ado files.
```
    #get files
    hg clone https://kk-adofiles.googlecode.com/hg/kk-adofiles 
    cd kk-adofiles

    #if this isn't a folder recognized by Stata, you could use the .toc file to install:
    stata
    . net from "`c(pwd)'"
```
  1. In Stata 12+, you can type the following (this doesn't work in Stata 11 and below)
```
    net from http://kk-adofiles.googlecode.com/hg/
 
    net describe pub2web, from("http://kk-adofiles.googlecode.com/hg/")
    net install  pub2web, from("http://kk-adofiles.googlecode.com/hg/")
```
  1. Click [browse](http://code.google.com/p/kk-adofiles/source/browse/) link above. When you click on a file, you'll see a "View raw file" link in a box on the right. (Notice that you can download a .zip or .tar file with all files.) Download file and save into your "personal" or "plus" directory.  (To see where your personal or plus directory is, type `. adopath` into Stata's command line.  Save the files you find under the [file tree](http://code.google.com/p/kk-adofiles/source/browse/) into the personal directory.  See `.help sysdir` for details.)


# Other #
  * [Excel macro to "Paste as Values" or "Paste as Unformatted Text"  and other VBA macros](http://code.google.com/p/kk-adofiles/wiki/ExcelPasteValuesEtc)
  * [AutoIt scripts](http://code.google.com/p/kk-adofiles/source/browse/#hg%2Fumd-researchport) to copy/paste University Library Subscription Information into Mozilla Firefox and Google Chrome (made for University of Maryland, but can be customized).