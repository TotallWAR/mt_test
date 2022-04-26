# Moneytree test task

The task is to implement a checkout system (a cash register) that meets the following requirements:
- It can scan items.
- It can compute the total price.
- It can apply promotion campaigns, which are configurable.

#### Items
| Item | Price      |
|------|------------|
| A    | JPY 3000   |
| B    | JPY 2000   |
| C    | JPY 5000   |
| D    | JPY 1500   |

#### Promotion Campaigns
- If 3 of item A are purchased, the price for all 3 is JPY 7500.
- If 2 of item B are purchased, the price for both is JPY 3500.
- If the total basket price (after previous discounts) is over JPY 15000, the basket
receives a discount of JPY 2000.


####Example Test Data

| Basket               | Price         |
|----------------------|---------------|
| A, B, C              | JPY 10000     |
| B, A, B, A, A        | JPY 11000     |
| C, B, A, A, D, A, B  | JPY 15500     |
| C, A, D, A, A        | JPY 14000     |


####Design Considerations
We expect the marketing team will want to invent new types of promotional rules beyond the current multi-buy and basket total promotions. The design should allow the system to extended.


## Additional info
Git history is included so you can see the thought process.

Frontend is located in `app/javascript/bundles` and powered by `React 17`

## Deps
- ruby 2.7.5
- node 16+

## Get started
Run commands to set up:

```bundle```

```yarn```

```rails db:seed```

To dev: ```foreman start -f Procfile.dev```
and open `http://localhost:3000` in browser


## Tests
To run tests type command `rails test`

Tests are build with Example Test Data from tech assignment above.

## Architecture
I've developed the system with opportunity for extending for other promo campaigns.

We have 2 main tables:

 items:

| col   | type           |
|-------|----------------|
| code  | string         |
| name  | string         |
| image | string         |
| price | numeric(12, 2) |

promo_campaigns:

| col           | type     |
|---------------|----------|
| campaign_type | string   |
| name          | string   |
| rules         | text     |
| date_from     | datetime |
| date_to       | datetime |

Tables are connected with third table with many-to-many relationship type by id col.

The main idea that campaigns store a `campaign_type` field which can be used for detecting what type of rule policy should be applied.
Each campaign has `rules` column which is a stringified JSON. (it can be a json type for postgresql). These rules' scheme depends on `campaign_type` field.

We have only two `campaign_type`s right now: `basket_discount | good_discount` for basket and for goods(items) accordingly. 

Our service knows about what `campaign_type` can be and about rules structure for each type.
We can extend this system by adding new `campaign_type` and new rules.

Right now any promo campaign can be applied to any product with the logic of a discount, depending on the number of products.
Total basket discount can be configured with different params too.

Each `campaign_type` has its own implementation so can be easily extended.

Creating of such campaigns can be divided into separate service like CRM for managers who can create new campaigns remotely.
`date_from` and `date_to` cols can be used for controlling campaign "lifecycle". Besides creating items can be seperated into service too.
It can be added more validation and error handling both on the frontend and the backend.

Frontend part is organized under `javascript` directory.
The `Checkout system` is seperated in module and split into chunk. So new modules can be added without affecting on this one.

Logic for extracting data and keeping it up to date is seperated into custom react hooks and context.

We can use an i18n lib for translations in future, create adaptive design etc.

## Copyright
Made by Aleksandr Grigorenko

Bootstrapped with [React on Rails](https://github.com/shakacode/react_on_rails)