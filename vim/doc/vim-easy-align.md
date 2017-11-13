vim-easy-alignのサンプル
========================

## **スペースのサンプル**

Paul McCartney 1942
George Harrison 1943
Ringo Starr 1940
Pete Best 1941


    <Enter><space> 1カラムのみ整列

Paul   McCartney 1942
George Harrison 1943
Ringo  Starr 1940
Pete   Best 1941

    <Enter>2<space> 2カラム整列

Paul McCartney  1942
George Harrison 1943
Ringo Starr     1940
Pete Best       1941

    <Enter>*<space> 全カラム整列

Paul   McCartney 1942
George Harrison  1943
Ringo  Starr     1940
Pete   Best      1941

    <Enter>-<space> 右から1カラム整列

Paul McCartney  1942
George Harrison 1943
Ringo Starr     1940
Pete Best       1941

    <Enter>-2<space> 右から2カラム整列

Paul   McCartney 1942
George Harrison 1943
Ringo  Starr 1940
Pete   Best 1941

    <Enter><Enter><space> 1カラム目を右寄せで整列

  Paul McCartney 1942
George Harrison 1943
 Ringo Starr 1940
  Pete Best 1941

    <Enter><Enter>*<space> 全て右寄せで整列

  Paul McCartney 1942
George  Harrison 1943
 Ringo     Starr 1940
  Pete      Best 1941

    <Enter><Enter><Enter>*<space> 全て真ん中寄せで整列

  Paul  McCartney 1942
 George Harrison  1943
 Ringo    Starr   1940
  Pete    Best    1941

## **|のサンプル**

| Option| Type | Default | Description |
|--|--|--|--|
| threads | Fixnum | 1 | number of threads in the thread pool |
|queues |Fixnum | 1 | number of concurrent queues |
|queue_size | Fixnum | 1000 | size of each queue |
|   interval | Numeric | 0 | dispatcher interval for batch processing |
|batch | Boolean | false | enables batch processing mode |
 |batch_size | Fixnum | nil | number of maximum items to be assigned at once |
 |logger | Logger | nil | logger instance for debug logs |

    <Enter>*| 全て整列

| Option     | Type    | Default | Description                                    |
| --         | --      | --      | --                                             |
| threads    | Fixnum  | 1       | number of threads in the thread pool           |
| queues     | Fixnum  | 1       | number of concurrent queues                    |
| queue_size | Fixnum  | 1000    | size of each queue                             |
| interval   | Numeric | 0       | dispatcher interval for batch processing       |
| batch      | Boolean | false   | enables batch processing mode                  |
| batch_size | Fixnum  | nil     | number of maximum items to be assigned at once |
| logger     | Logger  | nil     | logger instance for debug logs                 |

    <Enter>**| 右左の順で整列

|     Option | Type    | Default | Description                                    |
|         -- | --      |      -- | --                                             |
|    threads | Fixnum  |       1 | number of threads in the thread pool           |
|     queues | Fixnum  |       1 | number of concurrent queues                    |
| queue_size | Fixnum  |    1000 | size of each queue                             |
|   interval | Numeric |       0 | dispatcher interval for batch processing       |
|      batch | Boolean |   false | enables batch processing mode                  |
| batch_size | Fixnum  |     nil | number of maximum items to be assigned at once |
|     logger | Logger  |     nil | logger instance for debug logs                 |

    <Enter><Enter>*| 右寄せ

|     Option |    Type | Default |                                    Description |
|         -- |      -- |      -- |                                             -- |
|    threads |  Fixnum |       1 |           number of threads in the thread pool |
|     queues |  Fixnum |       1 |                    number of concurrent queues |
| queue_size |  Fixnum |    1000 |                             size of each queue |
|   interval | Numeric |       0 |       dispatcher interval for batch processing |
|      batch | Boolean |   false |                  enables batch processing mode |
| batch_size |  Fixnum |     nil | number of maximum items to be assigned at once |
|     logger |  Logger |     nil |                 logger instance for debug logs |

    <Enter><Enter>**| 左右の順で整列

| Option     |    Type | Default |                                    Description |
| --         |      -- | --      |                                             -- |
| threads    |  Fixnum | 1       |           number of threads in the thread pool |
| queues     |  Fixnum | 1       |                    number of concurrent queues |
| queue_size |  Fixnum | 1000    |                             size of each queue |
| interval   | Numeric | 0       |       dispatcher interval for batch processing |
| batch      | Boolean | false   |                  enables batch processing mode |
| batch_size |  Fixnum | nil     | number of maximum items to be assigned at once |
| logger     |  Logger | nil     |                 logger instance for debug logs |

    <Enter><Enter><Enter>*| 真ん中寄せ

|   Option   |  Type   | Default |                  Description                   |
|     --     |   --    |   --    |                       --                       |
|  threads   | Fixnum  |    1    |      number of threads in the thread pool      |
|   queues   | Fixnum  |    1    |          number of concurrent queues           |
| queue_size | Fixnum  |  1000   |               size of each queue               |
|  interval  | Numeric |    0    |    dispatcher interval for batch processing    |
|   batch    | Boolean |  false  |         enables batch processing mode          |
| batch_size | Fixnum  |   nil   | number of maximum items to be assigned at once |
|   logger   | Logger  |   nil   |         logger instance for debug logs         |

## **=のサンプル**

```
a =
a = 1
bbbb = 2
ccccccc = 3
ccccccccccccccc
ddd = 4
eeee === eee = eee = eee=f
fff = ggg += gg &&= gg
g != hhhhhhhh == 888
i   := 5
i     %= 5
i       *= 5
j     =~ 5
j   >= 5
aa      =>         123
aa <<= 123
aa        >>= 123
bbb               => 123
c     => 1233123
d   =>      123
dddddd &&= 123
dddddd ||= 123
dddddd /= 123
gg <=> ee
```

    <Enter>=

```
a         =
a         = 1
bbbb      = 2
ccccccc   = 3
ccccccccccccccc
ddd       = 4
eeee    === eee = eee = eee=f
fff       = ggg += gg &&= gg
g        != hhhhhhhh == 888
i        := 5
i        %= 5
i        *= 5
j        =~ 5
j        >= 5
aa       => 123
aa      <<= 123
aa      >>= 123
bbb      => 123
c        => 1233123
d        => 123
dddddd  &&= 123
dddddd  ||= 123
dddddd   /= 123
gg      <=> ee
```

    <Enter>*=

```
a         =
a         = 1
bbbb      = 2
ccccccc   = 3
ccccccccccccccc
ddd       = 4
eeee    === eee       = eee   = eee = f
fff       = ggg      += gg  &&= gg
g        != hhhhhhhh == 888
i        := 5
i        %= 5
i        *= 5
j        =~ 5
j        >= 5
aa       => 123
aa      <<= 123
aa      >>= 123
bbb      => 123
c        => 1233123
d        => 123
dddddd  &&= 123
dddddd  ||= 123
dddddd   /= 123
gg      <=> ee
```

    <Enter>**=

```
a         =
a         =        1
bbbb      =        2
ccccccc   =        3
ccccccccccccccc
ddd       =        4
eeee    ===      eee  = eee   = eee = f
fff       =      ggg += gg  &&=  gg
g        != hhhhhhhh == 888
i        :=        5
i        %=        5
i        *=        5
j        =~        5
j        >=        5
aa       =>      123
aa      <<=      123
aa      >>=      123
bbb      =>      123
c        =>  1233123
d        =>      123
dddddd  &&=      123
dddddd  ||=      123
dddddd   /=      123
gg      <=>       ee
```

    <Enter><Enter>**=

```
              a   =
              a   = 1
           bbbb   = 2
        ccccccc   = 3
ccccccccccccccc
            ddd   = 4
           eeee === eee       = eee   = eee = f
            fff   = ggg      +=  gg &&= gg
              g  != hhhhhhhh == 888
              i  := 5
              i  %= 5
              i  *= 5
              j  =~ 5
              j  >= 5
             aa  => 123
             aa <<= 123
             aa >>= 123
            bbb  => 123
              c  => 1233123
              d  => 123
         dddddd &&= 123
         dddddd ||= 123
         dddddd  /= 123
             gg <=> ee
```

    <Enter><Enter><Enter>*=

```
       a          =
       a          =    1
     bbbb         =    2
    ccccccc       =    3
ccccccccccccccc
      ddd         =    4
     eeee       ===   eee     = eee   = eee = f
      fff         =   ggg    += gg  &&= gg
       g         != hhhhhhhh == 888
       i         :=    5
       i         %=    5
       i         *=    5
       j         =~    5
       j         >=    5
      aa         =>   123
      aa        <<=   123
      aa        >>=   123
      bbb        =>   123
       c         => 1233123
       d         =>   123
    dddddd      &&=   123
    dddddd      ||=   123
    dddddd       /=   123
      gg        <=>    ee
```


## **yaml**

ファイいるのシンタックスを使用しているので下記リンク参照
[vim-easy-align.yml](https://github.com/junegunn/vim-easy-align/blob/master/vim-easy-align.yml)


## **python**

ファイいるのシンタックスを使用しているので下記リンク参照
[vim-easy-align.py](https://github.com/junegunn/vim-easy-align/blob/master/vim-easy-align.py)

