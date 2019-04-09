# A query language and ATtiny database written in uLisp
This application is a simple query language to allow you to create a database of information about a particular domain, and then write queries to find answers to questions about that domain. It's written in uLisp, so you could run it on a microcontroller board such as the Adafruit ItsyBitsy M4. Because uLisp is compatible with Common Lisp you could alternatively run it on any Common Lisp implementation.

It includes a sample database of information about Microchip ATtiny processors, to allow you to choose the best processor meeting the requirements of a particular project. Note that it doesn't include information about the new ATtiny 0-Series or 1-Series families.

Alternatively you could use the query language to build an information system for your own application.

It's a simplified version of a popular type of example given in several Lisp books, including: Paul Graham's "On Lisp" (pp. 246-254), available as a PDF on his site: [Download On Lisp](http://www.paulgraham.com/onlisptext.html), his "ANSI Common Lisp" (pp. 247-256), and Peter Norvig's "Paradigms of Artificial Intelligence Programming" (pp 348-387), available as a PDF on GitHub: [paip-lisp](https://github.com/norvig/paip-lisp).

#### Running the query language

To install the query language on uLisp:

* Copy the file **query-language.lisp**, paste it into the Arduino IDE Serial Monitor input field, and press **Return**.

* Copy the file **attiny-database.lisp**, paste it into the Arduino IDE Serial Monitor input field, and press **Return**.

* Give the command:

      (read-data)

* Try out the examples below.

### Submitting a query

To query the database you give a query of the form:

    (answer '(query) '(output))
    
where **query** is a query you want to submit to the database, and **output** is a list to format the output.

The **query** can contain variables beginning with a question mark, such as **?x**, which will be set to matching values in the database. So, for example, the query:

    (flash ?c ?x)

will match every rule in the database starting with **flash**, such as:

    (flash attiny85 8192)

After this successful match the variable **?c** will be set to **attiny85** and **?x** will be set to **8192**. These values can be referred to later in the **query**, or in the **output** list.

You can combine queries with **and**, **or**, and **not**, and you can test values using **test**.

The **output** list can consist of a series of strings and variables to print the variables in each successful match. For example, after the above match the output list:

    ("Chip:" ?c "has flash:" ?x)
    
will print:

    Chip: attiny85 has flash: 8192

### Examples

For example, the database allows you to ask questions such as:

* Find the price (in pence) of each chip with 8 Kbytes of flash:

````text
>  (answer '(and (flash ?c ?x) (price ?c ?k ?p) (test (= ?x 8192))) '("Chip:" ?c "Package:" ?k "Price:" ?p))
Chip: attiny828 Package: tqfp Price: 84 
Chip: attiny88 Package: pdip Price: 143 
Chip: attiny88 Package: tqfp Price: 76 
Chip: attiny861 Package: pdip Price: 110 
Chip: attiny861 Package: soic Price: 92 
Chip: attiny841 Package: soic Price: 78 
Chip: attiny84 Package: pdip Price: 87 
Chip: attiny84 Package: soic Price: 60 
Chip: attiny85 Package: pdip Price: 90 
Chip: attiny85 Package: soic Price: 72
````

* Find all chips with at least 10 Kbytes of flash:

````text
> (answer '(and (flash ?c ?x) (test (> ?x 10240))) '("Flash > 10K:" ?c))
Flash > 10K: attiny1634 
Flash > 10K: attiny167 
````

* Find all chips that have I2C slave support in hardware:

````text
> (answer '(and (family ?c ?f) (i2c ?f slave)) '("I2C Slave support:" ?c))
I2C Slave support: attiny828 
I2C Slave support: attiny1634 
I2C Slave support: attiny48 
I2C Slave support: attiny88 
I2C Slave support: attiny441 
I2C Slave support: attiny841 
````

* Find all chips that have at least three timers (8-bit or 16-bit):

````text
> (answer '(and (family ?c ?f) (timer8 ?f ?x) (timer16 ?f ?y) (test (>= (+ ?x ?y) 3)))
  '("3 Timers:" ?c))
3 Timers: attiny441 
3 Timers: attiny841 
````
For more information see http://forum.ulisp.com/t/a-query-language-and-attiny-database-written-in-ulisp/337.
