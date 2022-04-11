import * as React from "react";
import { ChangeEvent, FunctionComponent, useState } from "react";
// @ts-ignore
import style from "./ItemsPicker.module.css";
// @ts-ignore
import generalStyle from "../../../common/styles/general.module.css";

import ItemList from "../item-list/ItemList";
import Input from "../../../common/components/basic/input/Input";
import { useItems } from "../../hooks/useItems";
import Loading from "../loading/Loading";

interface IProps {}

const ItemsPicker: FunctionComponent<IProps> = ({}: IProps) => {
    const [itemCode, setItemCode] = useState("");
    const { items, loading, err, clear } = useItems({ code: itemCode });

    const handleItemInput = (e: ChangeEvent<HTMLInputElement>) => {
        setItemCode(e.target.value);
    };

    return (
        <div className={style.itemsPicker}>
            <div className={style.inputWrapper}>
                <Input
                    id="scanner-input"
                    handleInput={handleItemInput}
                    autoFocus
                    placeholder={"A"}
                    label={"Scan product code"}
                />
            </div>

            <button onClick={clear}>Clear basket</button>

            {loading ? <Loading /> : null}
            {err ? <p className={generalStyle.err}>{err}</p> : null}
            <ItemList items={items} />
        </div>
    );
};

export default ItemsPicker;
