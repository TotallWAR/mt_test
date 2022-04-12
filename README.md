# Moneytree test task

## Deps
- ruby 2.7.5
- node 16+

## Get started
Run commands to set up:

```bundle```

```yarn```

```rails db:seed```

To dev: ```foreman start -f Procfile.dev```


## Tests
To run tests type command `rails test`

Tests are build with Example Test Data from tech assignment file.

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

We can use an i18n lib for translations in future.

## Copyright
Made by Aleksandr Grigorenko

Bootstrapped with [React on Rails](https://github.com/shakacode/react_on_rails)