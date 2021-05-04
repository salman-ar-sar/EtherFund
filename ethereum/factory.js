import web3 from './web3';
import CampaignFactory from './build/CampaignFactory.json';

const instance = new web3.eth.Contract(
    JSON.parse(CampaignFactory.interface), '0x7b7730B40A91B7eA973Cc06B703c3f38Ef127F08');

export default instance;