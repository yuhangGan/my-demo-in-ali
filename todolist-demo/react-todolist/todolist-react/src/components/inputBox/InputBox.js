import React, { useState } from 'react'
import './style.css'

export default function (props) {
    const { handleKeyUp } = props;
    const [value, setValue] = useState('');

    const myHandleKeyup = e => {
        if (e.keyCode === 13 && value) {
            handleKeyUp(value)
            setValue('')
        }
    }

    return (
        <div>
            <input
                className="input-box"
                value={value}
                placeholder="wirte down your plan ..."
                onChange={e => setValue(e.target.value)}
                onKeyUp={myHandleKeyup}
            />
        </div>
    )
}