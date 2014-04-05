# ActiveRecord::Relation Checker

[![Build Status](https://secure.travis-ci.org/durnoyabsurd/relation_checker.png)](http://travis-ci.org/durnoyabsurd/relation_checker)
[![Coverage Status](https://coveralls.io/repos/durnoyabsurd/relation_checker/badge.png)](https://coveralls.io/r/durnoyabsurd/relation_checker)

__WARNING!__ This gem is under development and has no stable version yet!

## Background

Given an ActiveRecord chain returning an ActiveRecord::Relation object.<br />
How to test it in our specs?<br />
There are two common ways for that:

1. Use factories to store test data in the database, then make real queries to it and see if the results are matching our expectations. This approach has some difficulties:
  * It's damn slow.
  * It's much harder to write such specs than the ActiveRecord queries themselves.
  * Such specs are not unit tests. In addition to testing our actual code, we also test ActiveRecord, DB adapter, DB itself and so on, but we don't need it in our unit tests.
2. Stub out the chain – just check that proper methods are called so that we get true unit tests which are also fast, but:
  * It's still too hard to write specs.
  * It's bound to the realization. Say, if we move some clauses to a new scope or vice versa, then the test will fail despite of the code equivalence. In a nutshell – we don't need tests like "fail if the source code has changed".

## The solution

This gem introduces the checker object which looks into the relation generated by a query chain and checks if it's meeting all the expectations.
Basically, it checks if all necessary WHEREs (and other clauses) are on their place. If it's OK, the checker says that it equals the relation.

## Features

* No DB queries and factory generated objects, so it's fast.
* Not bound to the query chain realization – it compares the result relation, no matter which way it was obtained.
* Allows pure unit testing without any side effects.
* The syntax looks like usual ActiveRecord query, so it's easy to write specs.
* Independent of the testing engine: RSpec, Minitest, Test::Unit, whatever…

## Requirements

* Ruby >= 1.9
* Rails >= 3.2

## Installation

1. Add to your Gemfile:
   
   ```ruby
   gem 'relation_checker', github: 'durnoyabsurd/relation_checker', group: :test
   ```

2. Run ```bundle install```.

## Usage

Given a method returning a relation object:

```ruby
def products
  @products ||= Product.where(public: true)
end
```

Let's test it using RSpec:

```ruby
it 'should return published products' do
  expect(Product.relation_checker.where(public: true)).to eq(subject.products)
end
```

Notice, that we expect the checker to be equal to the method result, not contrariwise.

The point is to call ```.relation_checker``` method on the ActiveRecord model and then we can chain it further with ```.where```, ```.order``` and others.

## Testing

```shell
  bundle exec rspec spec
```

## Contribution

Just fork this repo and make a pull request if you wish.
