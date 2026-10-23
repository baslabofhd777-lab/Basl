# Basl

مستودع العقود الذكية الرئيسي — تم دمج وتنظيف كل المحتوى المفيد هنا.

## العقود المتوفرة (Solidity ^0.8.20)

| العقد | الوصف |
|------|------|
| **APENFT.sol** | توكن ERC-20 كامل مع خاصية Pause (الاسم: APENFT، الرمز: NFT، 6 منازل عشرية) |
| **SimpleERC20.sol** | توكن ERC-20 بسيط ونظيف (قابل للتخصيص في الاسم والرمز) |
| **Pausable.sol** | عقود أساسية: Ownable + Pausable |
| **TimelockToken.sol** | قفل زمني للتوكنات (يُحرر بعد وقت محدد) |

## أمثلة الاستخدام

### APENFT
```solidity
// نشر توكن بمليار وحدة
APENFT token = new APENFT(1_000_000_000);

// إيقاف التحويلات (المالك فقط)
token.pause();

// إعادة التفعيل
token.unpause();
```

### SimpleERC20
```solidity
// نشر توكن مخصص
SimpleERC20 token = new SimpleERC20("MyToken", "MTK", 1_000_000);
```

### TimelockToken
```solidity
// قفل توكنات لمدة معينة
TimelockToken lock = new TimelockToken(
    address(token),
    beneficiaryAddress,
    block.timestamp + 30 days
);
```

## الملفات الأخرى
- `env.example` — مثال لمفاتيح البيئة
- `agent.json` + `skills/` — إعدادات المهارات (code-reviewer وغيرها)
- `.github/workflows/` — سير عمل GitHub

## الترخيص
Apache-2.0
