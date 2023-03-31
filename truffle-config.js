const HDWalletProvider = require('@truffle/hdwallet-provider')
require('dotenv').config()
module.exports = {
  networks: {
    fuji: {
      provider: () => {
        return new HDWalletProvider({
          mnemonic: process.env.MNEMONIC,
          providerOrUrl: 'https://api.avax-test.network/ext/bc/C/rpc',
          chainId: '43113'
        })
      },
      network_id: "*",
      gasPrice: 225000000000
    }
  },
  compilers: {
    solc: {
      version: "0.8.6"
    }
  },
  plugins: ["solidity-coverage"]
};