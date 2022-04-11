import * as React from "react";
import { FunctionComponent } from "react";
import Item, { IItem } from "../item/Item";

// @ts-ignore
import style from "./ItemList.module.css";

interface IProps {
    items: IItem[];
}

const ItemList: FunctionComponent<IProps> = ({ items }: IProps) => (
    <div className={style.itemList}>
        {items.map(item => (
            <Item key={item.id} {...item} />
        ))}
    </div>
);

export default ItemList;
