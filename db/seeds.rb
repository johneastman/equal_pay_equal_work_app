# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
ContactInfo.create!([
    {
        first_name: "John",
        last_name: "Doe",
        mailing_address: "123 Main St."
    },
    {
        first_name: "Greg",
        last_name: "Johnson",
        mailing_address: "1445 Johnson Ave."
    },
    {
        first_name: "Maxwell",
        last_name: "Kellogg",
        mailing_address: "1300 Union Blvd."
    }
])
