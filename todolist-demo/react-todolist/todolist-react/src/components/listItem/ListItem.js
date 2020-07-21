import React, { useState, useEffect } from 'react'
import './style.css'


export default function ListItem(props) {
    return (
        <div className={`list-item ${props.item.isDone ? 'finished' : ''}`}>
            {props.item.listItem}
            <button onClick={() => props.deleteItem(props.index, props.item.id)}>delete</button>
            <button onClick={() => props.finishItem(props.index, props.item.id, !props.item.isDone)}>{props.item.isDone ? '✔' : 'finish'}</button>
        </div>
    )
}