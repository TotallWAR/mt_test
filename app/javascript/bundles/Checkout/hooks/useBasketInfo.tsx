import { useContext, useEffect, useState } from "react";
import { ItemsContext } from "../context/items.context";

export const useBasketInfo = () => {
    const { items } = useContext(ItemsContext);

    const [totalPrice, setTotalPrice] = useState(0);
    const [totalPriceDiscount, setTotalDiscountPrice] = useState(0);
    const [err, setErr] = useState(null);
    const [loading, updateLoading] = useState(false);

    useEffect(() => {
        (async () => {
            if (items && items.length) {
                updateLoading(true);
                const res = await fetch(
                    `/checkout/summary?${getQueryItemsParams(items)}`
                );
                if (res.ok) {
                    setErr(null);
                    const result = await res.json();
                    setTotalPrice(result.total_price_without_discount);
                    setTotalDiscountPrice(result.total_price_with_discount);
                } else {
                    setErr(res.statusText);
                }
                updateLoading(false);
            }
        })();
    }, [items]);

    return {
        basketInfo: {
            totalPrice,
            totalPriceDiscount,
        },
        err,
        loading,
    };
};

const getQueryItemsParams = (items = []) =>
    items.reduce(
        (params, item, ind, arr) =>
            `items[]=${item.id}${arr.length - 1 !== ind ? "&" : ""}`,
        ""
    );
