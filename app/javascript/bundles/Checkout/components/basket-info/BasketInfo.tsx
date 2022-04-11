import * as React from "react";
import { FunctionComponent, useContext } from "react";
// @ts-ignore
import style from "./BasketInfo.module.css";
// @ts-ignore
import generalStyle from "../../../common/styles/general.module.css";

import { useBasketInfo } from "../../hooks/useBasketInfo";
import Loading from "../loading/Loading";

interface IProps {}

const BasketInfo: FunctionComponent<IProps> = ({}: IProps) => {
    const { basketInfo, loading, err } = useBasketInfo();
    return (
        <div className={style.basketInfo}>
            {loading ? <Loading /> : null}
            {err ? <p className={generalStyle.err}>{err}</p> : null}
            <p>Total price: <b>{basketInfo?.totalPrice}</b></p>
            <p>Total price with discount: <b>{basketInfo?.totalPriceDiscount}</b></p>
        </div>
    );
};

export default BasketInfo;
