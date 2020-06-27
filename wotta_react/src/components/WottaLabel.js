import React from 'react';
import PropTypes from 'prop-types';

const WottaLabel = props => {

    const stl = {};
    if (props.color) {
        stl.color = props.color;
    }

    return (
        <span style={stl}>
            <i><b>W</b></i>ott<i><b>A</b></i>
        </span>
    );
};

WottaLabel.propTypes = {
    color: PropTypes.string
};

export default WottaLabel;