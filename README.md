# Collaborative Growth (co-op 2.0)
>A better model for collaboration: effectively coordinate growth &amp; share in its value
## The Stack
- [NFT](http://erc721.org/) that represents a real-world asset
    - Oracle (like [ChainLink](https://chain.link/)) to provide a reliable connection between the NFT and the physical asset
- [RFT (Re-Fungible Token)](https://medium.com/@billyrennekamp/re-fungible-token-rft-297003592769) to sell shares in the NFT
- [Curation Markets](https://medium.com/@simondlr/tokens-2-0-curved-token-bonding-in-curation-markets-1764a2e0bee5) for value discovery of those NFTs
    - Alternatively a TCR, given the market would be small in the beginning

## Set up

### Environment
uses node version v10.15.0 (it's reccommended to use `nvm` for node version management)

update smart contract libraries:
```
git submodule update --init --recursive
```

add dependencies with npm:
```
npm install
```

### Local development / testing

Start your local blockchain:
```
ganache-cli
```

(Alternatively you can use the GUI version of ganache)

Deploy the token contracts:
```
truffle migrate
```

Start the front-end:
```
some steps
```

## Use Case
>Coordinate communities around sustainable and local farming.
  - NFT represents either an [individual plant](https://www.baltimoresun.com/news/bs-xpm-1996-04-26-1996117052-story.html) or a plot of land
  - Owner of the NFT (either an organization like a co-op or an individual) can sell shares in that NFT
  - Shares guarantee the owner the right to that percentage of the harvest
    - Shares can also come with responsibilities?
  - Curation Markets exist for the organizations or individuals who grow and harvest
    - A rise in value in a curation market signals that market's associated NFTs should rise in value
## Why?
We need better models to join the resources of the community for the common good. By giving individuals the tools they need to add value into a resource they share ownership in - we can empower them to participate, collaborate, and earn value (harvest) from what they co-create (sew).

Co-ops today suffer from a lack of transparency, accountability, and discovery. Communities also lack for incentives to join their resources for the common good. With the rise of the food industry and its destruction of our environment, we now have both the tools and the reasons to change the way we operate to better suit our needs as a global society.
## ETHDenver 2019!
Sound interesting? Hack with me at ETHDevner \\(^-^)/
## Acknowledgements
- [Billy Rennekamp](https://github.com/okwme) for creating RFTs
- [Simon de la Rouviere](https://github.com/simondlr) for creating Curation Markets
- [Balázs Némethi](https://twitter.com/nembal) for pointing out that [creating a unique identity for individual plants is not a new idea](https://www.baltimoresun.com/news/bs-xpm-1996-04-26-1996117052-story.html) ;)
