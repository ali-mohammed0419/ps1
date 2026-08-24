    .set noat

subu $2, $0, $1      # $2 = -10 = 0xFFFFFFF6
slt  $3, $2, $0      # signed:  -10 < 0  => 1
sltu $4, $2, $0      # unsigned: 0xFFFFFFF6 < 0 => 0
addu $5, $2, $1      # -10 + 10 = 0
subu $6, $1, $2      # 10 - (-10) = 20
add  $7, $6, $1      # 20 + 10 = 30
