export function debounce(fn, time) {
    let timeout: NodeJS.Timeout | number = 0;
    return function (...args) {
        // eslint-disable-next-line @typescript-eslint/no-this-alias
        const self = this;

        const functionCall = function functionCall() {
            return fn.apply(self, args);
        };

        clearTimeout(timeout as NodeJS.Timeout);
        timeout = setTimeout(functionCall, time);
    };
}
