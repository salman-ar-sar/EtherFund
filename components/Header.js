import React from "react";
import { Menu } from 'semantic-ui-react';
import { Link } from '../routes';

const Header = () => {
    return (
        <Menu style={{ marginTop: '10px' }}>
            <Link route='/'><a className='item'><b>EtherFund</b></a></Link>
            <Menu.Item>A crowdfunding platform you can trust!</Menu.Item>
            <Menu.Menu position='right'>
            <Link route='/'><a className='item'>Campaigns</a></Link>
            <Link route='/campaigns/new'><a className='item'>+</a></Link>
            </Menu.Menu>
        </Menu>
    );
};

export default Header;