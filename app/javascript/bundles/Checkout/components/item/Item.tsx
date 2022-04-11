import * as React from "react";
import { FunctionComponent } from "react";

// @ts-ignore
import style from "./Item.module.css";

export interface IItem {
    id: number;
    name: string;
    code: string;
    price: number;
    image?: string;
}

type IProps = IItem;

// TODO
const DEFAULT_IMAGE = "https://placeholder.pics/svg/150";

const Item: FunctionComponent<IProps> = ({ image, price, name }: IProps) => (
    <div className={style.item}>
        <figure>
            <img src={image || DEFAULT_IMAGE} />
            <figcaption>
                <p>{name}</p>
                <p>
                    Price: <b>{price}</b>
                </p>
            </figcaption>
        </figure>
    </div>
);

export default Item;
