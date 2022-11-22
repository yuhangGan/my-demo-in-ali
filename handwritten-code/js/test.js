// 验证ipv4

function verifyIPV4(query) {

  if (!query) return 'no'

  const arr = query.split('.')
  const reg = new RegExp(/^\d+$/)

  if (arr.includes('')) return 'no'
  let isIPV4 = true

  for (let i in arr) {
    if (!reg.test(arr[i]) || arr[i][0] === '0' || (+arr[i] < 0 || + arr[i] > 255)) {
      isIPV4 = false
      break
    }
  }

  return isIPV4 ? 'yes' : 'no'
}



// console.log(verifyIPV4('11.252.33.4'))


// 深拷贝

function deepClone(obj) {

  if (!obj) return

  if (typeof obj !== 'object') return obj

  const newObj = obj instanceof Array ? [] : {}

  for (let key in obj) {
    newObj[key] = deepClone(obj[key])
  }

  return newObj

}

const aa = { a: 1, b: 2, c: { d: 3 }, e: [1, 2, 3] }
const cc = deepClone(aa)
cc.c.d = 4
cc.e[0] = 5
// console.log(aa, cc)


// promise
const RESOLVED = 'resolved'
const REJECTED = 'rejected'
const PENDING = 'pending'


class MyPromise {

  constructor(executor) {
    this.value = null
    this.state = PENDING
    this.reason = null
    this.onResCb = []
    this.onRejCb = []

    let resolve = (value) => {
      if (this.state !== PENDING) return
      this.state = RESOLVED
      this.value = value
      this.onResCb.forEach(fn => fn())
    }

    let rejecte = (reason) => {
      if (this.state !== PENDING) return
      this.state = REJECTED
      this.reason = reason
      this.onRejCb.forEach(fn => fn())
    }

    executor(resolve, rejecte)
  }

  then(onRes, onRej) {
    if (this.state === RESOLVED) {
      onRes(this.value)
    }

    if (this.state === REJECTED) {
      onRej(this.reason)
    }

    if (this.state === PENDING) {
      this.onResCb.push(() => onRes(this.value))
      this.onRejCb.push(() => onRej(this.reasonq))
    }
  }

}

// 手写new
function MyNew(fn) {
  const obj = {}
  obj._proto_ = fn.prototype
  const res = fn.apply(obj, [...arguments].slice(1))
  return typeof res === 'object' ? res : obj
}

// 防抖
function debounce(fn, delay) {
  let timer = null
  return function () {
    if (timer) clearTimeout(timer)
    timer = setTimeout(() => {
      fn.call(this, ...arguments)
    }, delay)
  }
}


function cb() {
  console.log(...arguments, arguments)
}

// cb(1, 2, 3)


// 有效括号 用栈思想做
function valid(str) {
  if (str.length % 2 === 1) return false

  const m = {
    '{': '}',
    '(': ')',
    '[': ']'
  }

  const arr = ['{', '(', '[']
  const stack = []

  for (let e of str) {
    if (arr.includes(e)) {
      stack.push(e)
    } else {
      let item = stack.pop()
      if (m[item] !== e) return false
    }
  }

  if (stack.length) return false

  return true
}

console.log(valid('(}'))