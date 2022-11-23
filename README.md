# The Equal Pay for Equal Work App

## Background
The State of Colorado passed the Equal Pay For Equal Work Act [1] in 2019, which intends to level the playing field for employees. It includes provisions such as "...requir[ing] employers to include compensation in job postings, notify employees of promotional opportunities, and keep job description and wage rate records" [2]. A complaint form [2] has been provided to notify the State of employers that are not complying with this law.

## Description
This project is a Ruby on Rails application that aims to provide an easy-to-use web interface to filling out Equal Pay for Equal Work complaint forms.

### Overview
Note that the application is currently a prototype, so the screenshots below do not reflect the final version of the user interface.

#### Users
The app will require sign in/sign up. This process not only provides the personal information required for the complaint form, but also allows users to view, edit, and delete complaints they have filed.
![signup page](/readme_images/sign_up.png)
![signin page](/readme_images/sign_in.png)

Users will also have the ability to edit their profiles to include contact information. If this contact information is not provided, complaint forms will be provided anonymously.
![edit user profile page](/readme_images/edit_user.png)

#### Employers
The main page will display a list of employers that have had complaints filed against them.
![main/employer complaints page](/readme_images/main_page.png)

Users can select an employer to view more information, including other complaints. From that page, users can also file their own complaints.
![employer profile page](/readme_images/employer_profile.png)

#### Complaints
Clicking on a complaint will display information about that complaint, and allow users to edit their complaints.
![complaint view page](/readme_images/complaint_view.png)

Users can also file their own complaints.
![file complaint form](/readme_images/complaint_form.png)

Finally, after a complaint has been created, users can generate the PDF form with the complaint and user data.
![complaint pdf popilated](/readme_images/generated_pdf.png)

## Design Nodes and Ideas
* Allow the user to fill out the form anonymously or not
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
