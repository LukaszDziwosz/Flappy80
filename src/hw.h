#ifndef HW_H
#define HW_H
/* Volatile hardware access: status polling must never be optimized away. */
#define HW(a) (*(volatile char *)(a))
#endif
