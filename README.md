# The Equal Pay for Equal Work App

## Background
The State of Colorado passed the Equal Pay For Equal Work Act [1] in 2019, which intends to level the playing field for employees. It includes provisions such as "...requir[ing] employers to include compensation in job postings, notify employees of promotional opportunities, and keep job description and wage rate records" [2]. A complaint form [2] has been provided to notify the State of employers that are not complying with this law.

## Description
This project is a Ruby on Rails application that aims to provide an easy-to-use web interface to filling out Equal Pay for Equal Work complaint forms.

## Design Nodes
* Allow the user to fill out the form anonymously or not
    * Form will be signed `Anonymous` if this option is selected
* Add form fields for each field in the complaint form
    * If possible, split web interface into multiple sections/pages (select "next" after each section).
* Generate and download the PDF with the information provided filled out in the form.
    * Consider automatically emailing form to State of Colorado?
    * Provide options to download/print/email form


## Misc
* Complaint form: https://cdle.colorado.gov/sites/cdle/files/Equal%20Pay%20Complaint%20Form%20Dec%202020_Distributed.pdf
* Faker: https://github.com/faker-ruby/faker

## Sources
[1] https://leg.colorado.gov/bills/sb19-085

[2] https://cdle.colorado.gov/equalpaytransparency

## License
This project is licensed under the [MIT License](LICENSE)
