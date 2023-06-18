const customERC20 = artifacts.require('CustomERC20');

module.exports = function (deployer) {
    // Deployment parameters
    const name = 'Sero';
    const symbol = 'STK';
    const decimals = 18;
    const customData1 = 'Data 1';
    const customData2 = 'Data 2';
    const customData3 = 'Data 3';
  
    deployer.deploy(customERC20, name, symbol, decimals, customData1, customData2, customData3);
};