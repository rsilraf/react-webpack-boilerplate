import React, {Component} from 'react'
import config from './config.json'

import styles from './HelloComp.css'

class HelloComp extends Component {
    render() {
        return (
            <div className={styles.root} >
                {config.greetText}
            </div>
        )
    }
}
export default HelloComp
