import web3 from './web3';
import CampaignFactory from './build/CampaignFactory.json';

const instance = new web3.eth.Contract(
    JSON.parse(CampaignFactory.interface), '0x0b0ff2a73485720508bab11be3080754d93633be');

export default instance;