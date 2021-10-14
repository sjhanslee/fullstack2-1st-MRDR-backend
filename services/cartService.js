import * as cartDao from '../models/cartDao'

export const createCart = async (items,user_id) => {
  try {
    return await cartDao.createCart (
      items,
      user_id
    );
  } catch (err) {
    console.log(err);
  }
}

export const getCart = async (id) => {
  try {
    const isCart = await cartDao.getCart (id);
    if (!isCart) {
      throw new Error ('404','Cart does not Exist')
    } 

    const anObj ={}
    isCart.forEach(item=>{
      const obj = {};

      const newObj = 
      {id:item.oid,size:item.size,color:item.color,count:item.count}
      obj[item['oid']]=newObj;



      delete item.oid;
      delete item.size;
      delete item.color;

      const arr = Object.keys(obj).map(key=>obj[key]);
      item.options=arr



      anObj[item['id']]=item;

    });

    return Object.keys(anObj).map(key=>anObj[key])

    

    
  }catch (err) {
    console.log(err)
  }
};