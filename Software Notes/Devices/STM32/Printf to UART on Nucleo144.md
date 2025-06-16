Disable any HMI Virtual Com Port if it is enabled. 
Configure the USART3 to mode asynchronous and set PD8 to USART3_TX and PD9 to USART3_RX. 
Add
```c
/* USER CODE BEGIN 0 */
int __io_putchar(int ch) {
  HAL_UART_Transmit(&huart3, (uint8_t *)&ch, 1, 0xFFFF);
  return ch;
}
```
to `main.c`
Now you can printf using uart to your pc over the integrated st-link. 
Make sure to end your printf calls with `\n`, otherwise nothing will be printed as 
[stdout is line buffered](https://community.st.com/t5/stm32-mcus-products/no-printf-output-on-uart-before-n/td-p/747931)

