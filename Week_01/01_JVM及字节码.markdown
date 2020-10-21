::: {.export-wrapper}
::: {style="font-size: 22px; padding: 0 15px 0;"}
::: {style="padding-bottom: 24px"}
week_01JVM及字节码
:::

::: {style="background: #e5e6e8; height: 1px; margin-bottom: 20px;"}
:::
:::

-   [JVM基础知识]{.content .mubu-node
    style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
    -   [常见的编程语言类型]{.content .mubu-node
        style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        -   [机器语言：给机器执行的二进制语言，每种CPU平台都有对应的机器语言]{.content
            .mubu-node
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        -   [汇编语言：给机器执行的二进制指令，按照人可以理解的助记符表示]{.content
            .mubu-node
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        -   [高级语言：为了方便人的理解，进而快速设计和实现程序代码，一般与机器语言和汇编语言没有关系，代码编写完成后通过编译或解释，转换成汇编码和机器码，给计算机执行。（可跨不同的目标平台和cpu，不需要关系目标平台的差异性）]{.content
            .mubu-node
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
            -   [是否有虚拟机]{.content .mubu-node
                style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
                -   [有虚拟机：Java,Lua,Ruby,部分JavaScript的实现]{.content
                    .mubu-node
                    style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
                -   [无虚拟机：C,C++,C\#,Golang,大部分常见的编程语言]{.content
                    .mubu-node
                    style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
            -   [变量是否有确定的类型]{.content .mubu-node
                style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
                -   [静态类型：Java，C，C++等]{.content .mubu-node
                    style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
                -   [动态类型：所有脚本类型的语言]{.content .mubu-node
                    style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
            -   [执行方法（编译执行、解释执行）]{.content .mubu-node
                style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
                -   [编译执行：C，C++，Golang，Rust，C\#，Java，Scala，Clojure，Kotlin，Swift等]{.content
                    .mubu-node
                    style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
                -   [解释执行：JavaScript的部分实现和NodeJs，Python，Perl，Ruby等]{.content
                    .mubu-node
                    style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
            -   [语言特点分类]{.content .mubu-node
                style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
                -   [面向过程：C，Basic，Pascal，Fortran等]{.content
                    .mubu-node
                    style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
                -   [面向对象：C++，Java，Ruby，Smalltalk等]{.content
                    .mubu-node
                    style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
                -   [函数式编程：LISP、Haskell、Erlang、OCaml、Clojure、F\#等等]{.content
                    .mubu-node
                    style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
                -   [注：纯面向对象语言，例如Ruby，所有的东西都是对象（Java不是所有东西都是对象，比如基本类型
                    int 、 long 等等，就不是对象，但是它们的包装类
                    Integer 、 Long 则是对象）]{.content .mubu-node
                    style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
    -   [关于跨平台（源码级别或者编译后可以运行在不同的系统平台上）]{.content
        .mubu-node
        style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        -   [源码跨平台（C++，找依赖就很麻烦）：]{.content .mubu-node
            images="%5B%7B%22id%22%3A%222b01753c6c0e5714f-9527991%22%2C%22oh%22%3A750%2C%22ow%22%3A1186%2C%22uri%22%3A%22document_image%2Fa3894835-0347-40c5-a7de-041437f8db9e-9527991.jpg%22%7D%5D"
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
            ::: {style="padding: 3px 0"}
            ![](https://img.mubu.com/document_image/a3894835-0347-40c5-a7de-041437f8db9e-9527991.jpg){.attach-img}
            :::
        -   [二进制跨平台（Java字节码）]{.content .mubu-node
            images="%5B%7B%22id%22%3A%2222c1753c6cbc1f06a-9527991%22%2C%22oh%22%3A616%2C%22ow%22%3A1216%2C%22uri%22%3A%22document_image%2Fe6c1ac1c-3a24-4fdd-b895-92a29f9630de-9527991.jpg%22%7D%5D"
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
            ::: {style="padding: 3px 0"}
            ![](https://img.mubu.com/document_image/e6c1ac1c-3a24-4fdd-b895-92a29f9630de-9527991.jpg){.attach-img}
            :::
        -   [总结：]{.content .mubu-node
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
            -   [脚本语言直接使用不同平台的解释器执行，称之为脚本跨平台，平台间的差异由
                不同平台上的解释器去解决。这样的话代码很通用，但是需要解释和翻译，效率
                较低。]{.content .mubu-node
                style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
            -   [编译型语言的代码跨平台，同一份代码，需要被不同平台的编译器编译成相应的
                二进制文件，然后再去分发和执行，不同平台间的差异由编译器去解决。编译产
                生的文件是直接针对平台的可执行指令，运行效率很高。但是在不同平台上编译复杂软件，依赖配置可能会产生很多环境方面问题，导致开发和维护的成本较高。]{.content
                .mubu-node
                style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
            -   [编译型语言的二进制跨平台，同一份代码，先编译成一份通用的二进制文件，然
                后分发到不同平台，由虚拟机运行时来加载和执行，这样就会综合另外两种跨平
                台语言的优势，方便快捷地运行于各种平台，虽然运行效率可能比起本地编译类
                型语言要稍低一点。
                而这些优缺点也是Java虚拟机的优缺点。]{.content
                .mubu-node
                style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
    -   [运行时（Runtime）与虚拟机（VM）]{.content .mubu-node
        style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        -   [简单的说JRE就是Java的运行时，包括虚拟机和相关的库等资源。可以说运行时提供了程序运行的基本环境，JVM在启动时需要加载所有运行时的核心库等资源，然后再加载我们的应用程序字节码，才能让应用程序字节码运行在JVM这个容器里。]{.content
            .mubu-node
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        -   [但也有一些语言是没有虚拟机的，编译打包时就把依赖的核心库和其他特性支持，一起静态打包或动态链接到程序中，比如Golang和Rust，C\#等。这样运行时就和程序指令组合在一起，成为了一个完整的应用程序，好处就是不需要虚拟机环境，坏处是编译后的二进制文件没法直接跨平台了。]{.content
            .mubu-node
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
    -   [关于内存管理与垃圾回收]{.content .mubu-node
        style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        -   [java的内存管理就是GC，JVM的GC模板不仅管理内存回收，也负责内存的分配和压缩整理]{.content
            .mubu-node
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        -   [对于Golang和Rust这些语言来说，其实也是存在垃圾回收的，但是它们没有虚拟机，在运行时（Runtime），编译打包的时候，可以把内存使用分析的模块一起打包到应用程序中，在运行期间有专门的线程来分析内存使用情况，进而决定什么时候执行GC，把不再使用的内存回收掉。这样就算是没有虚拟机，也可以实现GC。]{.content
            .mubu-node
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        -   [而Rust语言则更进一步，直接在语言规范层面限制了所有变量的生命周期，如果超出了一个明确的范围，就会不可用，这样在编译期就能直接知道每个对象在什么时候应该分配内存，什么时候应该销毁并回收内存，做到了很精确并且很安全的内存管理。]{.content
            .mubu-node
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
-   [Java字节码技术]{.content .mubu-node
    style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
    -   [Java字节码简介：Java
        bytecode由单字节（byte）组成，理论上支持256个（byte为8位，2的8次方为256）操作码（opcode），实际上Java只使用了200左右的操作码，还有一些操作码则保留给调试操作。操作码（指令）主要由类型前缀及操作名称组成（例如，\'i\'前缀代表'integer'，所以，\'iadd\'很容易理解,表示对整数执行加法运算）]{.content
        .mubu-node
        style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        -   [栈操作指令，包括与局部变量交互的指令]{.content .mubu-node
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        -   [程序流程控制指令]{.content .mubu-node
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        -   [对象操作指令，包括方法调用指令]{.content .mubu-node
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        -   [算数运算及类型转换指令]{.content .mubu-node
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
    -   [获取字节码清单：编译.java文件（javac
        -g:编译java文件并生成局部变量表LocalVariabletable）生成.class文件，反编译.class文件（javap
        -c -verbose class文件）]{.content .mubu-node
        style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
    -   [解读字节码清单]{.content .mubu-node
        style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
    -   [查看class文件中的常量池（Constant
        pool）信息:大多数时候指的是运行时常量池。由class文件中的常量池结构体组成的]{.content
        .mubu-node
        style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
    -   [查看方法信息：栈深度、局部变量表中保留多少个槽位、方法参数个数（stack=2,
        locals=2, args_size=1 ）]{.content .mubu-node
        style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
    -   [线程栈与字节码执行模型：JVM是一台基于栈的计算机器，每个线程都有属于自己的线程栈（JVM
        stack），用于存储栈帧（Frame，包含操作数栈，局部变量数组以及一个class引用组成，class引用指向当前方法在运行时常量池中对应的class），每一次方法调用，JVM都会自动创建一个栈帧。]{.content
        .mubu-node
        style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
    -   [方法体中的字节码解读:关于new等操作符（助记符）占用字段，助记符占用一个，操作码占用两个（4位）]{.content
        .mubu-node
        style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
    -   [对象初始化指令：new指令，init以及clinit简介：注意参看JVM_Opcode助记符列表.pdf]{.content
        .mubu-node
        style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
    -   [栈内存操作指令]{.content .mubu-node
        style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        -   [dup，dup_x1，dup2_x1指令说明]{.content .mubu-node
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
    -   [局部变量表]{.content .mubu-node
        style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
    -   [流程控制指令]{.content .mubu-node
        style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
    -   [算术运算指令与类型转换指令]{.content .mubu-node
        style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
    -   [方法调用指令和参数传递]{.content .mubu-node
        style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        -   [invokestatic]{.content .mubu-node
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
            -   [调用某个类的静态方法]{.content .mubu-node
                style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
            -   [方法调用指令中最快]{.content .mubu-node
                style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        -   [invokespecial]{.content .mubu-node
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
            -   [调用构造函数，同一类中private方法，可见父类超方法]{.content
                .mubu-node
                style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        -   [invokevirtual]{.content .mubu-node
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
            -   [调用公共，受保护和package级的私有方法]{.content
                .mubu-node
                style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        -   [invokeinterface]{.content .mubu-node
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
            -   [通过接口引用来调用方法]{.content .mubu-node
                style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        -   [invokedynamic]{.content .mubu-node
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
            -   [JDK7新增，是实现动态类型语言的，jdk8中的lambda表达式的实现基础]{.content
                .mubu-node
                style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
-   [JVM类加载器]{.content .mubu-node
    style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
    -   [类的生命周期和加载过程：Loading、Verification、Preparation、Resolution统称为类加载]{.content
        .mubu-node
        images="%5B%7B%22id%22%3A%223141753ea1393618-9527991%22%2C%22oh%22%3A430%2C%22ow%22%3A805%2C%22uri%22%3A%22document_image%2F6f3833fe-9ee4-497a-bd16-3146d2ff017b-9527991.jpg%22%7D%5D"
        style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        ::: {style="padding: 3px 0"}
        ![](https://img.mubu.com/document_image/6f3833fe-9ee4-497a-bd16-3146d2ff017b-9527991.jpg){.attach-img}
        :::

        -   [加载（Loading）]{.content .mubu-node
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
            -   [根据明确知道的class完全限定名，获取二进制classfile格式的字节流（找到文件系统/jar包中/存在于任何位置的class文件）。如果找不到二进制文件，则报出NoClassDefFound错误]{.content
                .mubu-node
                style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
            -   [加载阶段不会检查classfile文件的格式和语法]{.content
                .mubu-node
                style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
            -   [整个过程由JVM和java的类加载系统共同完成（由JVM与具体的某一个类加载器java.lang.classLoader协作完成）]{.content
                .mubu-node
                style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        -   [检验（Verification）[链接过程的第一个阶段]{.bold
            style="font-weight: bold;"}]{.content .mubu-node
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
            -   [检查classfile的语义，判断常亮池的符号，并执行类型检查]{.content
                .mubu-node
                style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        -   [准备（Preparation）[此阶段未执行任何java代码]{.bold
            style="font-weight: bold;"}]{.content .mubu-node
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
            -   [创建静态字段，并将其初始化为[标准默认值]{.bold
                style="font-weight: bold;"}（比如null或者0值），并分配方法表，即在方法区中分配这些变量所使用的的内存空间]{.content
                .mubu-node
                style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}\
                [[例如：public static int i = 1；在准备阶段 i
                的值会被初始化为0，后面在类初始化阶段才会执行赋值为1；但是下面如果使用final作为静态常量，某些JVM的行为就不一样了：
                public static final int i =
                1；对应常量i，在准备阶段就会被赋值1，其实这样还是比较puzzle，例如其他语言（C\#）有直接的常量关键字const，让告诉编译器在编译阶段就替换成常量，类似于宏指令，更简单。]{.bold
                style="font-weight: bold;"}]{.note
                style="display: inline-block; color: rgb(136, 136, 136); line-height: 22px; min-height: 22px; font-size: 14px; padding-bottom: 2px;"}
        -   [解析（Resolution）]{.content .mubu-node
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}\
            [解析符号引用阶段，即解析常量池简单来说我们编写的代码中，当一个变量引用某个对象时，这个引用在.class文件中是以符号引用来存储的（相当于做了一个索引记录）在解析阶段就需要将其解析并链接为直接引用（相当于指向实际对象）。如果有了直接引用，那引用的目标必定在堆中存在。加载一个class时，需要加载其所有的super类​​​和super接口]{.note
            style="display: inline-block; color: rgb(136, 136, 136); line-height: 22px; min-height: 22px; font-size: 14px; padding-bottom: 2px;"}
            -   [类或接口的解析]{.content .mubu-node
                style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
            -   [字段解析]{.content .mubu-node
                style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
            -   [类方法解析]{.content .mubu-node
                style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
            -   [接口方法解析]{.content .mubu-node
                style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        -   [初始化（Initialization）]{.content .mubu-node
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}\
            [\--JVM规范明确规定，只有当某个类首次"主动使用"时才执行类初始化​​\--在子类初始化之前，先初始化其父类。所以在java中初始化一个类，必先初始化过java.lang.Object类，因为Object类是所有类的父类\--为了提高性能，HotSpot
            JVm​通常要等到类初始化时才去装载和链接（检验、准备、解析）类，因此如果A类引用了B类，那么加载A类时不一定会加载B类（除非需要验证），主动对B类执行第一条指令时才会导致B类的初始化，这就需要先对B完成装载和链接]{.note
            style="display: inline-block; color: rgb(136, 136, 136); line-height: 22px; min-height: 22px; font-size: 14px; padding-bottom: 2px;"}
            -   [类构造方法初始化]{.content .mubu-node
                style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
            -   [static静态变量赋值语句初始化]{.content .mubu-node
                style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
            -   [static静态代码块初始化]{.content .mubu-node
                style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        -   [使用（Using）]{.content .mubu-node
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        -   [卸载（Unloading）]{.content .mubu-node
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
    -   [类加载时机]{.content .mubu-node
        style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}\
        [\--JVM规范枚举了类的初始化的几种过程：​1.当虚拟机启动时，初始化用户指定的主类，即初始化启动执行的main方法所在的类2.当遇到用以新建目标示例的new指令时，初始化new指令的目标类，即初始化new指令的目标类3.当遇到调用静态方法的指令时，初始化该静态方法所在的类4.当遇到访问静态字段的指令时，初始化该静态字段所在的类5.子类的初始化会触发父类的初始化6.如果一个接口定义了default方法，那么直接或间接实现该接口的类​​​​的初始化会触发该接口的初始化7.使用反射API对某个类进行反射调用时，初始化此类。即反射调用要么是有类的实例，要么是调用类的静态方法，​都需要初始化8.当初次调用MethodHandle实例时，初始化该MethodHandle指向的方法所在的类​\--以下几种情况不会执行类的初始化1.通过子类引用父类的静态字段，只会触发父类的初始化，不会触发子类的初始化​​2.定义对象数组，不会触发该类的初始化​3.常量在编译期间会存入调用类的常量池中，本质上没有直接引用定义常量的类，不会触发定义常量所在的类的初始化4.通过类名获取Class对象，不会触发类的初始化，Hello.Class不会让Hello类初始化​​5.通过Class.forName加载指定类时，如果指定参数initialize为false时，也不会触发类的初始化，其实这个参数是告诉虚拟机，是否要对类进行初始化6.通过CLassLoader默认的loadClass方法，也不会触发初始化（加载了，但没有初始化）​​]{.note
        style="display: inline-block; color: rgb(136, 136, 136); line-height: 22px; min-height: 22px; font-size: 14px; padding-bottom: 2px;"}
    -   [类加载机制]{.content .mubu-node
        style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}\
        [特点：[1.双亲委托：]{.bold
        style="font-weight: bold;"}当一个自定义类加载器需要加载一个类，比如java.lang.String，它很懒，不会一上来就直接试图加载它，而是先委托自己的父加载器去加载，父加载器如果发现自己还有父加载器，会一直往前找，这样只要上级加载器，比如启动类加载器已经加载了某个类比如java.lang.String，所有的子加载器都不需要自己加载了。如果几个类加载器都没有加载到指定名称的类，那么会抛出ClassNotFountException异常。[2.负责依赖：]{.bold
        style="font-weight: bold;"}如果一个加载器在加载某个类的时候，发现这个类依赖于另外几个类或接口，也会去尝试加载这些依赖项。[3.缓存加载​​​：]{.bold
        style="font-weight: bold;"}为了提升加载效率，消除重复加载，一旦某个类被一个类加载器加载，那么它会缓存这个加载结果，不会重复加载三个​]{.note
        style="display: inline-block; color: rgb(136, 136, 136); line-height: 22px; min-height: 22px; font-size: 14px; padding-bottom: 2px;"}
        -   [启动类加载器（BootstrapClassLoader）]{.content .mubu-node
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}\
            [在JVM内部实现，JavaAPI无法拿到用来加载java核心类，是用原生C++实现的，并不继承自java.lang.ClassLoader（负责加载JDK中jre/lib/rt.jar里所有的class）他可以看做是JVM自带的，我们在代码层面无法直接获取到启动类加载器的引用，所以不允许直接操作他。比如：java.lang.String是由启动类加载器加载的，所以String.class.getClassLoader()就会返回null。但是后面可以看到通过命令行参数影响它加载什么​​​]{.note
            style="display: inline-block; color: rgb(136, 136, 136); line-height: 22px; min-height: 22px; font-size: 14px; padding-bottom: 2px;"}
        -   [扩展类加载器（ExtClassLoader）]{.content .mubu-node
            images="%5B%7B%22id%22%3A%22ec1753fcc72ee17b%22%2C%22oh%22%3A430%2C%22ow%22%3A803%2C%22uri%22%3A%22document_image%2F7328d189-d667-4f73-9f74-e45a151de472-9527991.jpg%22%2C%22w%22%3A805%7D%5D"
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
            ::: {style="padding: 3px 0"}
            ![](https://img.mubu.com/document_image/7328d189-d667-4f73-9f74-e45a151de472-9527991.jpg){.attach-img}
            :::

            \
            [在sun.misc.launcher包中定义，继承自URLClassLoader类（默认实现了从各种不同来源加载class字节码转换成Class的方法）​它负责加载JRE的扩展目录，lib/ext或者由java.ext.dirs系统属性指定的目录中的JAR包的
            ​​]{.note
            style="display: inline-block; color: rgb(136, 136, 136); line-height: 22px; min-height: 22px; font-size: 14px; padding-bottom: 2px;"}
        -   [应用类加载器（AppClassLoader）]{.content .mubu-node
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}\
            [在sun.misc.launcher包中定义，继承自URLClassLoader类（默认实现了从各种不同来源加载class字节码转换成Class的方法）它负载在JVM启动时加载来自java命令的classpath或者-cp选项、java.class.path系统属性指定的jar包和类路径。在应用程序代码里可以通过ClassLoader的静态方法getSystemClassLoader()来获取应用类加载器。如果没有特别指定，则在没有使用自定义类加载器情况下，用户自定义的类都由此加载器加载。​​​]{.note
            style="display: inline-block; color: rgb(136, 136, 136); line-height: 22px; min-height: 22px; font-size: 14px; padding-bottom: 2px;"}
    -   [自定义类加载器示例]{.content .mubu-node
        style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        -   []{.content .mubu-node
            images="%5B%7B%22id%22%3A%2253175401227490c5-9527991%22%2C%22oh%22%3A530%2C%22ow%22%3A669%2C%22uri%22%3A%22document_image%2Febc58c81-526e-431d-bcb7-7bfda99dad23-9527991.jpg%22%7D%5D"
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
            ::: {style="padding: 3px 0"}
            ![](https://img.mubu.com/document_image/ebc58c81-526e-431d-bcb7-7bfda99dad23-9527991.jpg){.attach-img}
            :::
        -   []{.content .mubu-node
            images="%5B%7B%22id%22%3A%222ba1754012ed7c13e%22%2C%22oh%22%3A538%2C%22ow%22%3A692%2C%22uri%22%3A%22document_image%2Ffdeb7115-0ecb-422e-a7cc-c46e110a56a7-9527991.jpg%22%7D%5D"
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
            ::: {style="padding: 3px 0"}
            ![](https://img.mubu.com/document_image/fdeb7115-0ecb-422e-a7cc-c46e110a56a7-9527991.jpg){.attach-img}
            :::
    -   [实用技巧]{.content .mubu-node
        style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        -   [如何排查找不到Jar包的问题]{.content .mubu-node
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        -   [如何排查类的方法不一致的问题]{.content .mubu-node
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        -   [怎么看到加载了哪些类，以及加载顺序]{.content .mubu-node
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        -   [怎么调整或修改ext和本地加载路径]{.content .mubu-node
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        -   [怎么运行期加载额外的jar包或者class呢]{.content .mubu-node
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
-   [JVM内存模型]{.content .mubu-node
    style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}\
    [规定了JVM应如何使用计算机内存（RAM），广义上讲，其分为：​1.java内存结构2.JMM（Java
    Memory Model，java内存模型）与线程规范​]{.note
    style="display: inline-block; color: rgb(136, 136, 136); line-height: 22px; min-height: 22px; font-size: 14px; padding-bottom: 2px;"}
    -   [JVM内存结构]{.content .mubu-node
        style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}\
        [JVM内部使用的java内存模型在逻辑上将内存划分为线程栈（thread
        stacks）、堆内存（heap）两个部分]{.note
        style="display: inline-block; color: rgb(136, 136, 136); line-height: 22px; min-height: 22px; font-size: 14px; padding-bottom: 2px;"}
        -   [JVM中每个正在运行的线程，都有自己的线程栈。线程栈包含了当前正在执行的方法链、调用链上的所有方法的状态信息（所以线程栈又被称为方法栈或调用栈（call
            stack）），线程在执行代码时，调用栈中的信息一直在变化。线程栈里面保存了调用链上正在执行的所有方法中的局部变量]{.content
            .mubu-node
            images="%5B%7B%22id%22%3A%221be1754022ef9e082-9527991%22%2C%22oh%22%3A347%2C%22ow%22%3A504%2C%22uri%22%3A%22document_image%2Ff1966898-a735-4562-9fcd-4c2cf60d69a5-9527991.jpg%22%2C%22w%22%3A271%7D%5D"
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
            ::: {style="padding: 3px 0"}
            ![](https://img.mubu.com/document_image/f1966898-a735-4562-9fcd-4c2cf60d69a5-9527991.jpg){.attach-img}
            :::

            \
            [每个线程只能访问自己的线程栈每个线程栈都不能访问（看不见）其他线程的局部变量​​]{.note
            style="display: inline-block; color: rgb(136, 136, 136); line-height: 22px; min-height: 22px; font-size: 14px; padding-bottom: 2px;"}
        -   [即使两个线程在执行相同的代码，但每个线程都会在自己的线程栈内创建对应代码中声明的局部变量，所以每个线程都有自己的一份局部变量副本]{.content
            .mubu-node
            images="%5B%7B%22id%22%3A%2289175409a99e2116-9527991%22%2C%22oh%22%3A751%2C%22ow%22%3A1178%2C%22uri%22%3A%22document_image%2F2231f4b8-2f4c-4c5e-a53c-7baec11a49aa-9527991.jpg%22%2C%22w%22%3A522%7D%5D"
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
            ::: {style="padding: 3px 0"}
            ![](https://img.mubu.com/document_image/2231f4b8-2f4c-4c5e-a53c-7baec11a49aa-9527991.jpg){.attach-img}
            :::

            \
            [所有原生类型的局部变量都存储在栈中，因此对其他线程是不可见的线程可以将原生变量值的副本传给另一个线程，但不能共享原生局部变量本身堆内存中包含了java代码中创建的所有对象，不管是哪个线程创建的。其中也涵盖了包装类型（Integer、Byte、Long等）​​不管是创建一个对象并将其赋值给局部变量​，还是赋值给另一个对象的成员变量，创建的对象都会被保存在堆内存中如果是原生数据类型的局部变量，那么他的内容就全部保留在线程栈上如果是对象引用，则栈中局部变量槽位中​​保存对象的引用地址，而实际上的对象内容保存在堆中对象的成员变量与对象本身一起存储在堆上，不管成员变量的类型时原生数值还是对象引用类的静态变量和类的定义一样，都保存在堆中​​[总结：]{.bold
            style="font-weight: bold;"}​方法中使用的原生数据类型和对象引用地址在栈上存储；对象、对象成员、类定义、静态变量在堆上]{.note
            style="display: inline-block; color: rgb(136, 136, 136); line-height: 22px; min-height: 22px; font-size: 14px; padding-bottom: 2px;"}
        -   [堆内存又称为"共享堆"，堆中所有对象，可以被所有线程访问，只要他们能拿到对象的引用地址]{.content
            .mubu-node
            images="%5B%7B%22id%22%3A%222d017540bad7dc058-9527991%22%2C%22oh%22%3A752%2C%22ow%22%3A1187%2C%22uri%22%3A%22document_image%2F1e6e07db-42cf-4532-a6bb-6d1482dc3e11-9527991.jpg%22%2C%22w%22%3A605%7D%5D"
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
            ::: {style="padding: 3px 0"}
            ![](https://img.mubu.com/document_image/1e6e07db-42cf-4532-a6bb-6d1482dc3e11-9527991.jpg){.attach-img}
            :::

            \
            [如果一个线程可以访问某个对象，也就可以访问该对象的成员变量如果两个线程同时调用某个对象的同一个方法​，则他们都可以访问到这个对象的成员变量，但每个对象的局部变量副本是独立的总结：虽然各个线程自己使用的局部变量都在自己的栈上，但是大家可以共享堆中的对象，特别地各个线程访问同一个对象实例的基础类型的成员变量，会给每个线程一个变量的副本]{.note
            style="display: inline-block; color: rgb(136, 136, 136); line-height: 22px; min-height: 22px; font-size: 14px; padding-bottom: 2px;"}
    -   [栈内存结构]{.content .mubu-node
        style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        -   [每启动一个线程，JVM就会在栈空间分配一个对应的线程栈，比如1Mb的空间（-Xss1m）]{.content
            .mubu-node
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        -   [线程栈也叫java方法栈，如果使用了JNI方法，则会分配一个单独的本地方法栈（Native
            Stack）]{.content .mubu-node
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        -   [线程执行过程中，一般会有多个方法调用栈（Stack
            Trace），比如A调用B，B调用C......每执行到一个方法，就会创建对应的栈帧（Frame）]{.content
            .mubu-node
            images="%5B%7B%22id%22%3A%225a175413135210b4-9527991%22%2C%22oh%22%3A732%2C%22ow%22%3A1253%2C%22uri%22%3A%22document_image%2F901a55bd-b10e-4d86-9014-51cc1e82f8dc-9527991.jpg%22%2C%22w%22%3A832%7D%5D"
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
            ::: {style="padding: 3px 0"}
            ![](https://img.mubu.com/document_image/901a55bd-b10e-4d86-9014-51cc1e82f8dc-9527991.jpg){.attach-img}
            :::

            \
            [栈帧是一个逻辑上的概念，具体的大小在一个方法编写完成后基本上就能确定。比如返回值需要​有一个空间存放吧，每个局部变量都需要对应的地址空间，此外还有给指令使用的操作数栈，以及class指针（标识这个栈帧对应的是哪个类的方法，指向非堆里面的class对象）。]{.note
            style="display: inline-block; color: rgb(136, 136, 136); line-height: 22px; min-height: 22px; font-size: 14px; padding-bottom: 2px;"}
    -   [堆内存结构]{.content .mubu-node
        images="%5B%7B%22id%22%3A%223931754384ca9810a-9527991%22%2C%22oh%22%3A451%2C%22ow%22%3A666%2C%22uri%22%3A%22document_image%2F94d3e4f9-5313-492c-a35b-289f1a6d8bc5-9527991.jpg%22%7D%5D"
        style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        ::: {style="padding: 3px 0"}
        ![](https://img.mubu.com/document_image/94d3e4f9-5313-492c-a35b-289f1a6d8bc5-9527991.jpg){.attach-img}
        :::

        \
        [堆内存是所有线程共用的内存空间，理论上大家都可以访问里面的内容。]{.note
        style="display: inline-block; color: rgb(136, 136, 136); line-height: 22px; min-height: 22px; font-size: 14px; padding-bottom: 2px;"}
        -   [JVM的具体实现一般会有各种优化。比如讲逻辑上的java堆，划分为堆（Heap）和非堆（Non-Heap）两个部分。]{.content
            .mubu-node
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}\
            [这里的划分依据在于，我们编写的java代码，基本上只能使用Heap这部分空间，发生内存分配和回收的主要区域也在这部分，所以有一种说法，这里的Heap也叫GC管理的堆（GC
            Heap）​]{.note
            style="display: inline-block; color: rgb(136, 136, 136); line-height: 22px; min-height: 22px; font-size: 14px; padding-bottom: 2px;"}
        -   [GC理论中有一个重要的思想，叫做分代。经过研究发现，程序中分配的对象，要么用过就扔，要么就能存活很久很久。因此JVM将Heap内存分为年轻代（Young
            generation）和老年代（Old
            generation，也叫Tenured）两部分]{.content .mubu-node
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        -   [年轻代还划分为3个内存池，新生代（Eden
            space）和存活区（Survivor
            space）,在大部分GC算法中有2个存活区（S0,S1），在我们可以观察到的任何时刻，S0和S1总有一个是空的，但一般较小，也不浪费多少空间，具体实现对新生代还有优化，那就是TLAB(Tread
            Loacl Allocation
            Buffer)，给每个线程先划定一小片空间，你创建的对象先在这里分配，满了再换。这能极大降低并发资源锁定的开销。]{.content
            .mubu-node
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        -   [Non-Heap本质上还是Heap，只是一般不归GC管理，里面划分为3个内存池。]{.content
            .mubu-node
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
            -   [Metaspace，以前叫持久代（永久代，Permanent
                generation）,Java8换了个名字叫Metaspace，Java8将方法区移动到了Meta区里面，而方法又是class的一部分，和css交叉了？]{.content
                .mubu-node
                style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
            -   [CSS，Compressed Class
                Space,存放class信息的，和Metaspace有交叉。]{.content
                .mubu-node color="#333333"
                style="color: rgb(51, 51, 51); line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
            -   [Code
                Cache，存放JIT编译器编译后的本地机器代码。]{.content
                .mubu-node color="#333333"
                style="color: rgb(51, 51, 51); line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
    -   [CPU指令与乱序执行]{.content .mubu-node
        style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        -   [计算机按支持的指令大致可分为]{.content .mubu-node
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
            -   [精简指令集（RISC）:ARM芯片，功耗低，运算能力较弱]{.content
                .mubu-node
                style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
            -   [复杂指令集（CISI）:Intel的X86芯片系列，比如奔腾、酷睿、至强，以及AMD的CPU，性能强劲，功耗高]{.content
                .mubu-node
                style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
    -   [JMM背景（Java Memory Model java内存模型）]{.content .mubu-node
        style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        -   [目前的JMM规范对应的是"\[JSR­133. Java Memory Model and
            Thread
            Specification\](<https://jcp.org/en/jsr/detail?id=133>)"这个规范的部分内容润色之后就成为了《Java
            语言规范》的 \[\$17.4. Memory Model章节\]
            (<https://docs.oracle.com/javase/specs/jls/se8/html/jls>­17.html\#jls­17.4)。可以看到，
            JSR133
            的最终版修订时间是在2014年，这是因为之前的Java内存模型有些坑，所以
            在Java
            1.5版本的时候进行了重新设计，并一直沿用到今天。]{.content
            .mubu-node
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
    -   [JMM简介]{.content .mubu-node
        style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        -   [能被多个线程共享使用的内存称为"共享内存"或"堆内存"]{.content
            .mubu-node
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        -   [所有的对象（包括内部的实例成员变量），static变量，以及数组都必须存放在堆中]{.content
            .mubu-node
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        -   [局部变量，方法的形参、入参，异常处理语句的入参不允许在线程之间共享，所以不受内存模型的影响]{.content
            .mubu-node
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        -   [多个线程同时对一个变量访问时（读取/写入），这个时候只要某个线程执行的是写操作，那么这个现象就称为冲突]{.content
            .mubu-node
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        -   [可以被其他线程感知或影响的行为，称为线程间的交互，可分为读取、写入、同步操作、外部操作等。其中同步操作包括：对volatile变量的读写，对管程（monitor）的锁定与解锁，线程的起始操作与结尾操作，线程启动和结束等。外部操作指：对线程执行环境之外的操作，比如停止其他线程等]{.content
            .mubu-node
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
    -   [内存屏障简介]{.content .mubu-node
        style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        -   [内存屏障可分为 读屏障 和 写屏障
            ，用于控制可见性。]{.content .mubu-node
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        -   [LoadLoad屏障：对于这样的语句Load1; LoadLoad;
            Load2，在Load2及后续读取操作要读取的数据被访问前，保证Load1要读取的数据被读取完毕。]{.content
            .mubu-node
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        -   [StoreStore屏障：对于这样的语句Store1; StoreStore;
            Store2，在Store2及后续写入操作执行前，保证Store1的写入操作对其它处理器可见。]{.content
            .mubu-node
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        -   [LoadStore屏障：对于这样的语句Load1; LoadStore;
            Store2，在Store2及后续写入操作被刷出前，保证Load1要读取的数据被读取完毕。]{.content
            .mubu-node
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        -   [StoreLoad屏障：对于这样的语句Store1; StoreLoad;
            Load2，在Load2及后续所有读取操作执行前，保证Store1的写入对所有处理器可见。它的开销是四种屏障中最大的。在大多数处理器的实现中，这个屏障是个万能屏障，兼具其它三种内存屏障的功能]{.content
            .mubu-node
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
-   [JVM启动参数]{.content .mubu-node
    style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}\
    [<https://blog.csdn.net/lpw_cn/article/details/84594859>]{.note
    style="display: inline-block; color: rgb(136, 136, 136); line-height: 22px; min-height: 22px; font-size: 14px; padding-bottom: 2px;"}
    -   [分类]{.content .mubu-node
        style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        -   [以-开头的标准参数]{.content .mubu-node
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
            -   [所有的JVM都要实现]{.content .mubu-node
                style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
            -   [向后兼容]{.content .mubu-node
                style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
            -   [例如：-server，-jar]{.content .mubu-node
                style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        -   [以-D设置系统属性，环境变量]{.content .mubu-node
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
            -   [例如：-Dfile.encoding=UTF-8]{.content .mubu-node
                style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        -   [以-X开头的非标准参数]{.content .mubu-node
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
            -   [供JVM使用]{.content .mubu-node
                style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
            -   [不是所有JVM都会实现这些功能]{.content .mubu-node
                style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
            -   [不保证向后兼容]{.content .mubu-node
                style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
            -   [例如：-Xms8g]{.content .mubu-node
                style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        -   [以-XX开头的非稳定参数]{.content .mubu-node
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
            -   [控制JVM行为]{.content .mubu-node
                style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
            -   [随时可能在下个版本取消]{.content .mubu-node
                style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
    -   [系统属性参数]{.content .mubu-node
        style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        -   []{.content .mubu-node
            images="%5B%7B%22id%22%3A%2227e17544f092140df-9527991%22%2C%22oh%22%3A530%2C%22ow%22%3A1133%2C%22uri%22%3A%22document_image%2F0e066cd5-27f1-4637-99f2-8a010ae2ed6a-9527991.jpg%22%7D%5D"
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
            ::: {style="padding: 3px 0"}
            ![](https://img.mubu.com/document_image/0e066cd5-27f1-4637-99f2-8a010ae2ed6a-9527991.jpg){.attach-img}
            :::
    -   [运行模式参数]{.content .mubu-node
        style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        -   []{.content .mubu-node
            images="%5B%7B%22id%22%3A%22f917544f0cae5166-9527991%22%2C%22oh%22%3A500%2C%22ow%22%3A1151%2C%22uri%22%3A%22document_image%2F9b84721e-69a0-48b8-98ac-09d28f728759-9527991.jpg%22%7D%5D"
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
            ::: {style="padding: 3px 0"}
            ![](https://img.mubu.com/document_image/9b84721e-69a0-48b8-98ac-09d28f728759-9527991.jpg){.attach-img}
            :::
    -   [堆内存设置参数]{.content .mubu-node
        style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        -   []{.content .mubu-node
            images="%5B%7B%22id%22%3A%22a217544f11586087-9527991%22%2C%22oh%22%3A522%2C%22ow%22%3A1243%2C%22uri%22%3A%22document_image%2F38a7854d-849c-447f-998c-7ae8316baeec-9527991.jpg%22%7D%5D"
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
            ::: {style="padding: 3px 0"}
            ![](https://img.mubu.com/document_image/38a7854d-849c-447f-998c-7ae8316baeec-9527991.jpg){.attach-img}
            :::
    -   [GC设置参数]{.content .mubu-node
        style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        -   []{.content .mubu-node
            images="%5B%7B%22id%22%3A%222d817544f15492024-9527991%22%2C%22oh%22%3A467%2C%22ow%22%3A1270%2C%22uri%22%3A%22document_image%2F330767dc-2cab-4ba5-9c5e-6ce5598d52e0-9527991.jpg%22%7D%5D"
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
            ::: {style="padding: 3px 0"}
            ![](https://img.mubu.com/document_image/330767dc-2cab-4ba5-9c5e-6ce5598d52e0-9527991.jpg){.attach-img}
            :::
    -   [分析诊断参数]{.content .mubu-node
        style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        -   []{.content .mubu-node
            images="%5B%7B%22id%22%3A%227317544f1ac6907d-9527991%22%2C%22oh%22%3A518%2C%22ow%22%3A1161%2C%22uri%22%3A%22document_image%2Fd66422b1-7221-42be-8704-97d06fc8c39b-9527991.jpg%22%7D%5D"
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
            ::: {style="padding: 3px 0"}
            ![](https://img.mubu.com/document_image/d66422b1-7221-42be-8704-97d06fc8c39b-9527991.jpg){.attach-img}
            :::
    -   [JavaAgent参数]{.content .mubu-node
        style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        -   []{.content .mubu-node
            images="%5B%7B%22id%22%3A%223d617544f1d6140d8-9527991%22%2C%22oh%22%3A447%2C%22ow%22%3A1191%2C%22uri%22%3A%22document_image%2F6cab78a3-e903-4af6-b30c-c22e62dce88b-9527991.jpg%22%7D%5D"
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
            ::: {style="padding: 3px 0"}
            ![](https://img.mubu.com/document_image/6cab78a3-e903-4af6-b30c-c22e62dce88b-9527991.jpg){.attach-img}
            :::
    -   [堆设置]{.content .mubu-node
        style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}\
        [​例如：java -Xmx3500m -Xms3500m -Xmn2g
        -Xss128k-Xmx3500m 设置JVM最大可用内存为3550M。-Xms3500m 设置JVM促使内存为3550m。此值可以设置与-Xmx相同，以避免每次垃圾回收完成后JVM重新分配内存。-Xmn2g 设置年轻代大小为2G。整个堆大小=年轻代大小 +
        年老代大小 +
        持久代大小 持久代一般固定大小为64m，所以增大年轻代后，将会减小年老代大小。此值对系统性能影响较大，Sun官方推荐配置为整个堆的3/8。-Xss128k 设置每个线程的堆栈大小。JDK5.0以后每个线程堆栈大小为1M，以前每个线程堆栈大小为256K。更具应用的线程所需内存大小进行调整。在相同物理内存下，减小这个值能生成更多的线程。但是操作系统对一个进程内的线程数还是有限制的，不能无限生成，经验值在3000\~5000左右。​]{.note
        style="display: inline-block; color: rgb(136, 136, 136); line-height: 22px; min-height: 22px; font-size: 14px; padding-bottom: 2px;"}
        -   [-Xms 初始堆大小]{.content .mubu-node
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        -   [-Xmx 最大堆大小]{.content .mubu-node
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        -   [-Xmn 年轻代大小，整个堆大小=年轻代大小 + 年老代大小 +
            持久代大小，持久代一般固定大小为64m，所以增大年轻代后，将会减小年老代大小。此值对系统性能影响较大，Sun官方推荐配置为整个堆的3/8。]{.content
            .mubu-node
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        -   [-Xss
            每个线程的堆栈大小，JDK5.0以后每个线程堆栈大小为1M，以前每个线程堆栈大小为256K。更具应用的线程所需内存大小进行调整。在相同物理内存下，减小这个值能生成更多的线程。但是操作系统对一个进程内的线程数还是有限制的，不能无限生成，经验值在3000\~5000左右。]{.content
            .mubu-node
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        -   [-XX:NewSize=n 设置年轻代大小]{.content .mubu-node
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        -   [-XX:NewRatio=n
            设置年轻代和年老代的比值。如:为3，表示年轻代与年老代比值为1：3，年轻代占整个年轻代年老代和的1/4]{.content
            .mubu-node
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        -   [-XX:SurvivorRatio=n
            年轻代中Eden区与两个Survivor区的比值。注意Survivor区有两个。如：3，表示Eden：Survivor=3：2，一个Survivor区占整个年轻代的1/5]{.content
            .mubu-node
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        -   [-XX:MaxPermSize=n 设置持久代大小]{.content .mubu-node
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
    -   [元空间设置]{.content .mubu-node
        style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}\
        [1.如果不指定元空间的大小，默认情况下，元空间最大的大小是系统内存的大小，元空间一直扩大，虚拟机可能会消耗完所有的可用系统内存。2.如果元空间内存不够用，就会报OOM。3.默认情况下，对应一个64位的服务端JVM来说，其默认的-XX:MetaspaceSize值为21MB，这就是初始的高水位线，一旦元空间的大小触及这个高水位线，就会触发Full
        GC并会卸载没有用的类，然后高水位线的值将会被重置。4.从第3点可以知道，如果初始化的高水位线设置过低，会频繁的触发Full
        GC，高水位线会被多次调整。所以为了避免频繁GC以及调整高水位线，建议将-XX:MetaspaceSize设置为较高的值，而-XX:MaxMetaspaceSize不进行设置。]{.note
        style="display: inline-block; color: rgb(136, 136, 136); line-height: 22px; min-height: 22px; font-size: 14px; padding-bottom: 2px;"}
        -   [-XX:MetaspaceSize 元空间初始大小]{.content .mubu-node
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        -   [-XX:MaxMetaspaceSize 元空间最大可分配大小]{.content
            .mubu-node
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        -   []{.content .mubu-node
            images="%5B%7B%22id%22%3A%2219a175442c194f0bf-9527991%22%2C%22oh%22%3A285%2C%22ow%22%3A568%2C%22uri%22%3A%22document_image%2Fe10b793e-362b-4daa-9931-6b406f8721eb-9527991.jpg%22%7D%5D"
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
            ::: {style="padding: 3px 0"}
            ![](https://img.mubu.com/document_image/e10b793e-362b-4daa-9931-6b406f8721eb-9527991.jpg){.attach-img}
            :::
    -   [收集器设置]{.content .mubu-node
        style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        -   [-XX:+UseSerialGC 设置串行收集器]{.content .mubu-node
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        -   [-XX:+UseParallelGC 设置并行收集器]{.content .mubu-node
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        -   [-XX:+UseParalledlOldGC 设置并行年老代收集器]{.content
            .mubu-node
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        -   [-XX:+UseConcMarkSweepGC 设置并发收集器]{.content .mubu-node
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
    -   [并行收集器设置]{.content .mubu-node
        style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        -   [-XX:ParallelGCThreads=n 设置并行收集器收集时使用的CPU数。并行收集线程数。]{.content
            .mubu-node
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        -   [-XX:MaxGCPauseMillis=n 设置并行收集最大暂停时间]{.content
            .mubu-node
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        -   [-XX:GCTimeRatio=n 设置垃圾回收时间占程序运行时间的百分比。公式为1/(1+n)]{.content
            .mubu-node
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
    -   [并发收集器设置]{.content .mubu-node
        style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        -   [-XX:+CMSIncrementalMode 设置为增量模式。适用于单CPU情况。]{.content
            .mubu-node
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        -   [-XX:ParallelGCThreads=n 设置并发收集器年轻代收集方式为并行收集时，使用的CPU数。并行收集线程数。]{.content
            .mubu-node
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
    -   [垃圾回收统计信息]{.content .mubu-node
        style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        -   [-XX:+PrintGC]{.content .mubu-node
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        -   [-XX:+PrintGCDetails]{.content .mubu-node
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        -   [-XX:+PrintGCTimeStamps]{.content .mubu-node
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        -   [-Xloggc:filename]{.content .mubu-node
            style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
    -   [<https://www.cnblogs.com/rinack/p/9888692.html>]{.content
        .mubu-node
        images="%5B%7B%22id%22%3A%2212175441f4d5c0b1-9527991%22%2C%22oh%22%3A334%2C%22ow%22%3A654%2C%22uri%22%3A%22document_image%2F05a665a2-dc9c-41e9-ae40-2186ae220f3d-9527991.jpg%22%7D%2C%7B%22id%22%3A%228017544229dfe17e-9527991%22%2C%22oh%22%3A266%2C%22ow%22%3A689%2C%22uri%22%3A%22document_image%2F4307715f-ed6c-4ca9-9743-efdaa68aae03-9527991.jpg%22%2C%22w%22%3A714%7D%5D"
        style="line-height: 24px; min-height: 24px; font-size: 16px; padding: 2px 0px; display: inline-block; vertical-align: top;"}
        ::: {style="padding: 3px 0"}
        ![](https://img.mubu.com/document_image/05a665a2-dc9c-41e9-ae40-2186ae220f3d-9527991.jpg){.attach-img}
        :::

        ::: {style="padding: 3px 0"}
        ![](https://img.mubu.com/document_image/4307715f-ed6c-4ca9-9743-efdaa68aae03-9527991.jpg){.attach-img}
        :::
:::
