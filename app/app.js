import React from 'react'
import {render} from 'react-dom'
import HelloComp from './HelloComp'

// styles
import './app.css'

render (
    <HelloComp />,
    document.getElementById('app')
)
