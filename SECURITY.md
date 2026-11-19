# Security Policy - سياسة الأمان

## العقود المشمولة

هذا المستودع يحتوي عقود Solidity:
- `SimpleERC20.sol` - توكن ERC-20 بسيط
- `APENFT.sol` - توكن مع خاصية الإيقاف
- `Pausable.sol` - التحكم بالمالك والإيقاف
- `TimelockToken.sol` - قفل زمني

| Version / الفرع | Supported / مدعوم |
| ------- | ------------------ |
| main (latest) | :white_check_mark: |
| إصدارات قديمة / forks | :x: |

> تنبيه: هذه العقود تعليمية ولم تخضع لتدقيق خارجي. لا تستخدمها على Mainnet بأموال حقيقية بدون Audit.

## Reporting a Vulnerability - الإبلاغ عن ثغرة

1. لا تنشر الثغرة علناً في Issues.
2. افتح Issue بعنوان `[SECURITY]` مع وصف عام فقط، أو راسل المالك عبر GitHub.
3. اذكر: اسم العقد، نسخة Solidity (^0.8.20)، خطوات إعادة الإنتاج، التأثير المتوقع.
4. سأرد خلال 7 أيام كحد أقصى.

## نطاق الفحص

- Reentrancy في `TimelockToken.release()`
- صلاحيات المالك في `Pausable` / `APENFT` (خطر المركزية)
- front-running على `approve` في `SimpleERC20`
- فحوصات `address(0)` والـ `unchecked`

## Cloudflare Workers

هذا المستودع للعقود الذكية فقط ولا يحتوي Worker. فشل بناء `basl` في Cloudflare متوقع - يرجى فصل تكامل Cloudflare عن هذا المستودع من لوحة Cloudflare أو تجاهل هذا البناء.
