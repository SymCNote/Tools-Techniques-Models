

https://eprint.iacr.org/2024/105.pdf (CANS23) 这篇文章对比了在 SAT、SMT、MILP、CP 在比特级密码原件的效率。

### 对 MILP：

即使变量都为整数，也会在搜索时（隐含地）求小数类型的 LP 下界，而对一个操作，不同的不等式刻画方法会对应不同高度的 LP 下界，LP 下界越接近最优化的取值（或满足解）时求解速度越快。

* 约束多=模型变重，LP 下界变紧；
* 约束少=模型变轻，LP 下界变松；

因此，一味追求不等式数量少是低效的，应该在（LP 下界，不等式数量）之间找到平衡。

也就是说，使用贪心算法讲 Sbox 的约束不等式缩减到最少并非效率最高的办法，引入一些约束来缩紧 LP 边界可能更有效（下面例子来自 chatgpt）

<img width="975" height="200" alt="image" src="https://github.com/user-attachments/assets/e99f3d86-91fd-4f7b-8207-eded16dd68c4" />


LP 下界的评估有如 SageMath 的 polyhedron 接口 之类的方法。

### 对 CP：
