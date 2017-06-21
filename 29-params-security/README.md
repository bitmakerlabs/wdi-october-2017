# Parameters and Introduction to Security

In this lecture we discuss what Parameters (i.e. params) are, how to process them securely, and why they are a common vector for hacking attacks.

We the introduce the concepts of web security, different types of attacks, and what we can do about them.

## Agenda

* [Parameters](#strong-parameters) (55 mins)
* [Intro to Security](#intro-to-security) (60 mins)

## Parameters

* Parameters (i.e. Params) Explained
  * What are Params
  * Where do Params come from
    * GET request - From the URL and the Query String
    * POST or PATCH request - From the URL and Form data
  * Contents of Params
    * Default parameters - params[:controller] and params[:action]
    * Routing parameters - params[:id]
    * User-supplied parameters
* Processing Parameters
  * Piecemeal Assignment
  * Mass Assignment
    * Mass Assignment Vulnerability
  * Strong Parameters

## Introduction to Security

* Injection Attacks
  * SQL Injection
  * Directory Traversal
  * Code Execution

* Session Attacks
  * Session Hijacking
  * Session Fixation

* User Management Hacks
  * Privilege Escalation
  * Credential Stuffing

* Request Forgeries
  * Cross-Site Request Forgery (CSRF)
  * Server-Side Request Forgery (SSRF)

* Distributed Denial of Service Attacks (DDoS)

* What to do about Security?
  * Stay up-to-date
  * Strong authentication
  * Authorization
  * Rate Limiting
  * Code Reviews
  * Static Analysis (e.g. Brakeman)
  * Education

## Links

* [Ruby on Rails Security Guide](http://guides.rubyonrails.org/security.html)
* [OWASP Top 10](https://www.owasp.org/index.php/Top_10_2017-Top_10)
* [OWASP Proactive Controls](http://resources.infosecinstitute.com/owasp-proactive-controls-part-1)
* [nVisium Seccasts](https://nvisium.com/blog/tags/seccasts/)
* [Brakeman Security Analysis Gem](https://github.com/presidentbeef/brakeman)
