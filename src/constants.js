//import * as Web3 from 'web3'
import BigNumber from 'bignumber.js'

import Portis from '@portis/web3';
import Web3 from 'web3';

const myLocalNetwork = {
  nodeUrl: 'http://localhost:8545',
  networkId: 1550350112997,
  nodeProtocol: 'rpc',
};
const portis = new Portis('37fae2bb-2d96-41aa-94f2-ea384d783e77', myLocalNetwork);
const web3 = new Web3(portis.provider);

export const OPENSEA_URL = "https://opensea.io"
export const OPENSEA_JS_URL = "https://github.com/ProjectOpenSea/opensea-js"
export const GITHUB_URL = "https://github.com/ProjectOpenSea/ships-log"
export const DEFAULT_DECIMALS = 18
export let web3 = typeof web3 !== 'undefined'
  ? window.web3.currentProvider
  : new Web3.providers.HttpProvider('https://mainnet.infura.io')

// Replace this with Redux for more complex logic
const networkCallbacks = []
export const onNetworkUpdate = (callback) => {
  networkCallbacks.push(callback)
}

export async function connectWallet() {
  if (!window.web3) {
    web3 = new Portis('37fae2bb-2d96-41aa-94f2-ea384d783e77', myLocalNetwork);
  } else if (window.ethereum) {
    window.ethereum.enable()
  } else {
    const errorMessage = 'You need an Ethereum wallet to interact with this marketplace. Unlock your wallet, get MetaMask.io or Portis on desktop, or get Trust Wallet or Coinbase Wallet on mobile.'
    alert(errorMessage)
    throw new Error(errorMessage)
  }
  networkCallbacks.map((c) => c(web3))
}

export function toUnitAmount(baseAmount, tokenContract = null) {
  const decimals = tokenContract && tokenContract.decimals != null
    ? tokenContract.decimals
    : DEFAULT_DECIMALS

  const amountBN = new BigNumber(baseAmount.toString())
  return amountBN.div(new BigNumber(10).pow(decimals))
}

export function toBaseUnitAmount(unitAmount, tokenContract = null) {
  const decimals = tokenContract && tokenContract.decimals != null
    ? tokenContract.decimals
    : DEFAULT_DECIMALS

  const amountBN = new BigNumber(unitAmount.toString())
  return amountBN.times(new BigNumber(10).pow(decimals))
}

export async function promisify(inner) {
  return new Promise((resolve, reject) =>
    inner((err, res) => {
      if (err) { reject(err) }
      resolve(res)
    })
  )
}
