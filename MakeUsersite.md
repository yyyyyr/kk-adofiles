Here's what I did to make this site. I assume you have (1) Stata and (2) Mercurial and/or Tortoise-Hg.  If you don't use Mercurial, just skip to step #3. Then copy+paste all the files onto your server.

  1. Create new project on http://code.google.com  (In my case, http://code.google.com/p/kk-adofiles/)
  1. Initialize project on my computer.
```
 cd C:\Projects\code.google.com\
 hg init kk-adofiles
```
  1. Run my -pub2web- program from Stata
```
. pub2web pub2web memmax did3 <other packages> ///
    using "C:\Projects\code.google.com\kk-adofiles" ///
    , replace author("Keith Kranker") ///
    intro("Programs by Keith Kranker, Ph.D. Candidate, Department of Economics, University of Maryland ")
```
  1. Commit repository and push  (you'll be asked for your [googlecode.com password](http://code.google.com/hosting/settings))
```
 hg add 
 hg commit -m"My message"
 hg push https://kk-adofiles.googlecode.com/hg/kk-adofiles 
```
  1. Optional: Add project description and wiki pages at code.google.com
  1. Optional: Email webmaster@stata.com with the URL of your usersite and a description so that it can be added to the list of usersites found at `. net from http://www.stata.com/links/`  Stata Corp will then find your site and make it searchable so that Stata users can find it with -findit- and -net search-.

.

_Problems:_
If I were to start over, I might choose Bitbucket or Github.  The reason is that because

```
net from http://kk-adofiles.googlecode.com/hg/
```

doesn't work, even though `http://kk-adofiles.googlecode.com/hg/stata.toc` is a perfectly good `stata.toc` file ([click here](http://kk-adofiles.googlecode.com/hg/stata.toc) to see for yourself).  The only explanation is that there's a bug in Stata that keeps it from communicating with google's  server.