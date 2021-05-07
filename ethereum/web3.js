import Web3 from 'web3';

let web3;

if (typeof window !== 'undefined' && typeof window.web3 !== 'undefined') {
    web3 = new Web3(window.web3.currentProvider.enable());
} else {
    const provider = new Web3.providers.HttpProvider(
        'https://rinkeby.infura.io/v3/225f46b29e984a9395ce9088863a4f24'
    );
    web3 = new Web3(provider);
};
export default web3;