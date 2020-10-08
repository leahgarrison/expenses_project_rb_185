CREATE TABLE expenses(
    id serial PRIMARY KEY,
    amount numeric(6,2) NOT NULL CHECK(amount > 0.00),
    memo text NOT NULL,
    created_on date DEFAULT current_date
);