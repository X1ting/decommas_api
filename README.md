# Decommas Ruby SDK

The `decommas` gem provides a Ruby SDK to easily integrate with the Decommas API. With this SDK, you can fetch information about coins, tokens, NFTs, transactions, and more.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "decommas", ">= 0.0.2"
```
And then execute:

```bash
$ bundle install

```
Or install it yourself:

```bash
$ gem install decommas
```

### Usage:
First, configure your client (you might need an API key or other configuration details):

```ruby
Decommas.configure do |config|
  config.token = "YOUR_TOKEN"
  config.safe_mode = true
end
```

Then, use the provided methods to fetch data:

```ruby
# Fetch coins for an address
coins = Decommas::Api.coins(address: 'YOUR_ADDRESS')
```

# Fetch tokens for an address
```ruby
tokens = Decommas::Api.tokens(address: 'YOUR_ADDRESS')
```
### Available Methods:

/coins

Fetch coins for a specific address.

```ruby
Decommas::Api.coins(address: 'YOUR_ADDRESS', options: {})
```

/tokens

Fetch tokens for a specific address.

```ruby
Decommas::Api.tokens(address: 'YOUR_ADDRESS', options: {})
```

/nfts

Fetch NFTs for a specific address.

```ruby
Decommas::Api.nfts(address: 'YOUR_ADDRESS', options: {})
```

/transactions

Fetch transactions for a specific address with optional pagination.

```ruby
Decommas::Api.transactions(address: 'YOUR_ADDRESS', limit: 10, offset: 0)
```

/transfers_erc20

Fetch ERC20 transfers for a specific address with optional pagination.

```ruby
Decommas::Api.transfers_erc20(address: 'YOUR_ADDRESS', limit: 10, offset: 0)
```

/transfers_nft

```ruby
Decommas::Api.transfers_nft(address: 'YOUR_ADDRESS')
```

/protocols

```ruby
Decommas::Api.protocols(address: 'YOUR_ADDRESS')
```

/transaction_erc20_transfers

```ruby
Decommas::Api.transaction_erc20_transfers(chain_name: 'mainnet', tx: 'TX_HASH')
```

/all_tokens_metadata

```ruby
Decommas::Api.all_tokens_metadata(address: 'YOUR_ADDRESS')
```

/all_coins_metadata

```ruby
Decommas::Api.all_coins_metadata(address: 'YOUR_ADDRESS')
```

/token_metadata

```ruby
Decommas::Api.token_metadata(chain_name: 'mainnet', contract_address: 'CONTRACT_ADDRESS')
```



Contributing
Bug reports and pull requests are welcome on GitHub at https://github.com/x1ting/decommas. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the Contributor Covenant code of conduct.

License
The gem is available as open-source under the terms of the MIT License.

