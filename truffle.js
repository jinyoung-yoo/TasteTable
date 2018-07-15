/*
var HDWalletProvider = require("truffle-hdwallet-provider");

var mnemonic = "concert load couple harbor equip island argue ramp clarify fence smart topic";

module.exports = {
  networks: {
    development: {
      host: "localhost",
      port: 8545,
      network_id: "*" // Match any network id
    },
    ropsten: {
      provider: new HDWalletProvider(mnemonic, "https://ropsten.infura.io/"),
      network_id: 3 // official id of the ropsten network
    }
  }
};
*/

module.exports = {
  networks: {
    development: {
      host: "localhost",
      port: 8545,
      network_id: "*" // Match any network id
    },
     ropsten:  {
     network_id: 3,
     host: "localhost",
     port:  8545,
     gas:   2900000
}
  },
   rpc: {
    host: 'localhost',
    post:8080
   }
};
// module.exports = {
//     // See <http://truffleframework.com/docs/advanced/configuration>
//     // to customize your Truffle configuration!

//     networks: {
//         development: {
//             host: "127.0.0.1",
//             port: 7545,
//             network_id: "*"
//         }
//     }
// };

/*
module.exports = {
    networks: {
        development: {
            host: "localhost",
            port: 8545,
            network_id: "*" // Match any network id
        },
        ropsten:  {
            network_id: 3,
            host: "localhost",
            port:  8545,
            gas:   2900000
        }
    },
    rpc: {
        host: 'localhost',
        post:8080
    }
};*/
