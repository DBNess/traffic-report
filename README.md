Analysis of online forum posts potentially supporting human trafficking.
If you suspect human trafficking, please call 1-888-3737-888 to notify the National Human Trafficking Resource Center as soon as possible.

**Using Technology to Combat the evolution of Trafficking & Identify Crime Rings**
**Goal**: Examine prevalent online marketplaces to detect patterns in contact information or services across seemingly unrelated offering categories.
**Sources**: Backpages, Craiglist
**Methods**: Pull and standardize site posts, extract phone numbers, age, location, and reporting information

**Relevant Resources**: 
    * Wired, "How Tech Tools Transformed New York’s Sex Trade" - http://www.wired.com/magazine/2011/01/ff_sextrade/all/1
    * Polaris Project, "Federal Sex Trafficking Cases in the United States 2000-2008" - https://na4.salesforce.com/sfc/play/index.jsp?oid=00D300000006E4S&d=kyMmYMmV7A9aYN.FSi81fYyeEKo%3D&v=06860000000HqhX&viewId=05H60000000IfVp

**Source: Backpage**	http://newyork.backpage.com/
Successfully gathered using wget with each category directory as dir:
    wget --mirror -w 2 -l 4 -I /dir -X /dir/classifieds http://newyork.backpage.com/dir? 
* Possible Sex Trafficking (Note: data gatherer must hold a cookie across requests to prove age requirement)
    * http://newyork.backpage.com/AdultJobs/
    * http://newyork.backpage.com/FemaleEscorts/
    * http://newyork.backpage.com/BodyRubs/
    * http://newyork.backpage.com/Strippers/
    * http://newyork.backpage.com/Domination/
    * http://newyork.backpage.com/TranssexualEscorts/
    * http://newyork.backpage.com/MaleEscorts/
    * http://newyork.backpage.com/TherapeuticMassage/
* Possible Domestic Servitude
    * http://newyork.backpage.com/LaborMoving/
    * http://newyork.backpage.com/LawnServices/
    * http://newyork.backpage.com/Childcare/
    * http://newyork.backpage.com/CleaningServices/
    * http://newyork.backpage.com/HealthServices/
    * http://newyork.backpage.com/MiscServices/

**Source: Craigslist**	http://newyork.craigslist.org/		
*Aborted because of problematic redirects and inconsistent data*

* Possible Sex Trafficking (Note: data gatherer must hold a cookie across requests to prove age requirement)
    * Therapeutic Services http://newyork.craigslist.org/thp/
    * Casual Encounters http://newyork.craigslist.org/cas/
    * Beauty Services http://newyork.craigslist.org/bts/
    * Domestic Servitude
    * Childcare http://newyork.craigslist.org/kid/
    * Farm & Garden Services http://newyork.craigslist.org/fgs/
    * Household Services http://newyork.craigslist.org/hss/
    * Labor & Moving http://newyork.craigslist.org/lbs/
    * Lessons & Tutoring http://newyork.craigslist.org/lss/
    * Pet Services http://newyork.craigslist.org/pas/
    * Et Cetera http://newyork.craigslist.org/etc/