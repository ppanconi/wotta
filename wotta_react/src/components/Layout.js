import React from 'react'
import {
    Container,
    Divider,
    Dropdown,
    Grid,
    Header,
    Image,
    List,
    Menu,
    Segment,
} from 'semantic-ui-react'

const Layout = () => (
    <div style={{height: '100%'}}>
        <Menu fixed='top' inverted>
            <Container>
                <Menu.Item as='a' header>
                    <Image size='mini' src='/logo.svg' style={{ marginRight: '1.5em' }} />
                    Project Name
                </Menu.Item>
                <Menu.Item as='a'>Home</Menu.Item>

                <Dropdown item simple text='Dropdown'>
                    <Dropdown.Menu>
                        <Dropdown.Item>List Item</Dropdown.Item>
                        <Dropdown.Item>List Item</Dropdown.Item>
                        <Dropdown.Divider />
                        <Dropdown.Header>Header Item</Dropdown.Header>
                        <Dropdown.Item>
                            <i className='dropdown icon' />
                            <span className='text'>Submenu</span>
                            <Dropdown.Menu>
                                <Dropdown.Item>List Item</Dropdown.Item>
                                <Dropdown.Item>List Item</Dropdown.Item>
                            </Dropdown.Menu>
                        </Dropdown.Item>
                        <Dropdown.Item>List Item</Dropdown.Item>
                    </Dropdown.Menu>
                </Dropdown>
            </Container>
        </Menu>

        <Container text style={{ marginTop: '7em', position: 'relative', minHeight: '100%', height: 'auto'}}>
            <Header as='h1'>Semantic UI React Fixed Template</Header>
            <p>This is a basic fixed menu template using fixed size containers.</p>
            <p>
                A text container is used for the main container, which is useful for single column layouts.
            </p>


        </Container>

        <Segment inverted vertical style={{ position: 'absolute', width: '100%', bottom: 0, margin: '1em 0em 0em', padding: '0.5em 0em' }}>
            <Container textAlign='center'>
                <Image centered size='mini' src='/logo.png' />
                <List horizontal inverted divided link size='small'>
                    <List.Item as='a' href='#'>
                        Site Map
                    </List.Item>
                    <List.Item as='a' href='#'>
                        Contact Us
                    </List.Item>
                    <List.Item as='a' href='#'>
                        Terms and Conditions
                    </List.Item>
                    <List.Item as='a' href='#'>
                        Privacy Policy
                    </List.Item>
                </List>
            </Container>
        </Segment>
    </div>
)

export default Layout