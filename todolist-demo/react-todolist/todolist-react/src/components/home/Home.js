import React, { useState, useEffect } from 'react'
import './home.css'

import InputBox from '../inputBox/InputBox'
import ListItem from '../listItem/ListItem'

import api from '../../api/index'

export default function Home(props) {
    const [list, setList] = useState([])
    const [curPage, setCurPage] = useState(0)

    //添加项目
    const myHandleKeyUp = async (listItem) => {
        const res = await api.addList({ item: listItem, isDone: false })
        console.log(res, '添加list的接口')
        setList([{ isDone: false, listItem, id: res.data.res.id }, ...list])
    }

    // 标记项目为已完成
    const finishItem = async (index, id, isDone) => {
        const res = await api.updateList({ id, isDone })
        console.log(res)
        list[index].isDone = isDone
        setList([...list])
    }

    //获取列表
    const getList = async () => {
        const res = await api.getList()
        console.log(res.data)
        setList([...res.data])
    }

    //跳转页码
    const nextPage = (i) => {
        if (i !== curPage) setCurPage(i)
    }

    //删除当前项
    const deleteItem = async (i, id) => {
        list.splice(i, 1)
        setList([...list])
        const res = await api.deleteList(id)
        console.log(res, '删除list的接口')
    }

    useEffect(() => {
        getList()
    }, [])

    return (
        <div>
            <h1 className="home">TO DO LIST</h1>
            <InputBox handleKeyUp={myHandleKeyUp} />
            <section className='list-box'>
                {list.map((e, i) => {
                    if (i >= curPage * 10 && i <= curPage * 10 + 9)
                        return <ListItem key={i} item={e} index={i} deleteItem={deleteItem} finishItem={finishItem} />
                })}
            </section>
            <section className='page-number'>
                {
                    list.length > 10 &&
                    new Array(parseInt(list.length / 10) + 1).fill('').map((e, i) => {
                        return <span key={i} style={{ color: curPage === i ? 'orange' : '' }} onClick={() => nextPage(i)}> {i + 1} </span>
                    })
                }
            </section>
        </div>
    )
}