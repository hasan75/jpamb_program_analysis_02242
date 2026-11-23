(analysis-summary
  :config (analysis-config
    :cmd (solutions/static/.venv/bin/static-interval)
    :analysis (analysis-info
      :name static-interval
      :version 1.0
      :group "Hasan Ahmed"
      :tags (static python)
      :system Linux-6.8.0-149-generic-x86_64-with-glibc2.35
    )
    :experiments (
      :"jpamb.cases.Arrays.arrayContent:()V" ()
      :"jpamb.cases.Arrays.arrayContentAboveMinus13:()V" ()
      :"jpamb.cases.Arrays.arrayFillUntilEqual:()V" ()
      :"jpamb.cases.Arrays.arrayInBounds:()V" ()
      :"jpamb.cases.Arrays.arrayIndexValue:(I)V" ()
      :"jpamb.cases.Arrays.arrayIsNull:()V" ()
      :"jpamb.cases.Arrays.arrayIsNullLength:()V" ()
      :"jpamb.cases.Arrays.arrayLength:()V" ()
      :"jpamb.cases.Arrays.arrayLoop:(I)V" ()
      :"jpamb.cases.Arrays.arrayNotEmpty:([I)V" ()
      :"jpamb.cases.Arrays.arrayOutOfBounds:()V" ()
      :"jpamb.cases.Arrays.arraySometimesNull:(I)V" ()
      :"jpamb.cases.Arrays.arraySpellsHello:([C)V" ()
      :"jpamb.cases.Arrays.arraySumIsLarge:([I)V" ()
      :"jpamb.cases.Arrays.arraySumIsLargeInt:(I)V" ()
      :"jpamb.cases.Arrays.binarySearch:(I)V" ()
      :"jpamb.cases.Arrays.secretThenDivide:([C)I" ()
      :"jpamb.cases.BitOperations.bitshiftLeft:(I)V" ()
      :"jpamb.cases.BitOperations.bitshiftRight:(I)V" ()
      :"jpamb.cases.BitOperations.bitshiftUnsignedRight:(I)V" ()
      :"jpamb.cases.BitOperations.bitwiseAnd:(II)V" ()
      :"jpamb.cases.BitOperations.bitwiseNot:(I)V" ()
      :"jpamb.cases.BitOperations.bitwiseOr:(II)V" ()
      :"jpamb.cases.BitOperations.drawInt:(I)V" ()
      :"jpamb.cases.BitOperations.xor:(II)V" ()
      :"jpamb.cases.Calls.allPrimesArePositive:(I)V" ()
      :"jpamb.cases.Calls.callsAssertFalse:()V" ()
      :"jpamb.cases.Calls.callsAssertFib:(I)V" ()
      :"jpamb.cases.Calls.callsAssertIf:(Z)V" ()
      :"jpamb.cases.Calls.callsAssertIfWithTrue:()V" ()
      :"jpamb.cases.Calls.callsAssertTrue:()V" ()
      :"jpamb.cases.Calls.callsBowtie:(II)I" ()
      :"jpamb.cases.Calls.callsCallChain:(II)I" ()
      :"jpamb.cases.Calls.callsCallCycle:(II)I" ()
      :"jpamb.cases.Calls.callsCallCycleFork:(II)I" ()
      :"jpamb.cases.Calls.callsCallCycleLoop:(II)I" ()
      :"jpamb.cases.Calls.callsCallCycleNext:(II)I" ()
      :"jpamb.cases.Calls.callsDiamond:(I)I" ()
      :"jpamb.cases.Calls.callsDumbbell:(II)I" ()
      :"jpamb.cases.Calls.callsTadpole:(II)I" ()
      :"jpamb.cases.Calls.callsWheel:(II)I" ()
      :"jpamb.cases.Calls.divideViaHelper:(I)I" ()
      :"jpamb.cases.Calls.divisionThroughHelper:(II)I" ()
      :"jpamb.cases.Dependent.badNormalizedDistance:(II)I" ()
      :"jpamb.cases.Dependent.combinedGuidance:(III)V" ()
      :"jpamb.cases.Dependent.compareEquality:(II)V" ()
      :"jpamb.cases.Dependent.divisionLoop:(I)V" ()
      :"jpamb.cases.Dependent.doubleIsAlwaysEven:(I)V" ()
      :"jpamb.cases.Dependent.normalizedDistance:(II)I" ()
      :"jpamb.cases.Dependent.safeDivByN:(I)I" ()
      :"jpamb.cases.Extended.safeDifferenceChain:(III)I" ()
      :"jpamb.cases.Extended.safeLoopAccumulation:(III)I" ()
      :"jpamb.cases.Extended.safeNestedLoopDivision:(III)I" ()
      :"jpamb.cases.Extended.safeSelectedDivisor:(ZIII)I" ()
      :"jpamb.cases.Extended.unsafeComputedRemainder:(IIIII)I" ()
      :"jpamb.cases.Extended.unsafeLoopOffsetDivisor:(IIII)I" ()
      :"jpamb.cases.Extended.unsafeModeDerivedDivisor:(IIII)I" ()
      :"jpamb.cases.Extended.unsafeNestedAffineDivisor:(IIIII)I" ()
      :"jpamb.cases.Extended.unsafeNestedLoopDivisor:(IIIII)I" ()
      :"jpamb.cases.Loops.decrementLoop:(I)V" ()
      :"jpamb.cases.Loops.doWhileDivision:(II)I" ()
      :"jpamb.cases.Loops.forLoopDivision:(II)I" ()
      :"jpamb.cases.Loops.forever:()V" ()
      :"jpamb.cases.Loops.loopRemainder:(II)I" ()
      :"jpamb.cases.Loops.multiplicationLoop:(I)V" ()
      :"jpamb.cases.Loops.nestedLoop:(I)V" ()
      :"jpamb.cases.Loops.neverAsserts:()V" ()
      :"jpamb.cases.Loops.neverDivides:()I" ()
      :"jpamb.cases.Loops.safeNestedBranchDivision:(III)I" ()
      :"jpamb.cases.Loops.terminates:()V" ()
      :"jpamb.cases.Loops.whileLoopDivision:(II)I" ()
      :"jpamb.cases.MagicConstants.computedIndex:(I)I" ()
      :"jpamb.cases.MagicConstants.derivedNull:(I)I" ()
      :"jpamb.cases.MagicConstants.loopAndEquality:(I)V" ()
      :"jpamb.cases.MagicConstants.loopDoubling:(I)V" ()
      :"jpamb.cases.MagicConstants.loopDoublingSafe:(I)V" ()
      :"jpamb.cases.MagicConstants.narrowEquality:(I)V" ()
      :"jpamb.cases.MagicConstants.rangeCondition:(I)V" ()
      :"jpamb.cases.MagicConstants.squareThreshold:(I)V" ()
      :"jpamb.cases.MagicConstants.squaredDivisor:(I)I" ()
      :"jpamb.cases.MagicConstants.sumReachesTarget:(I)V" ()
      :"jpamb.cases.MagicConstants.tableLookup:(I)I" ()
      :"jpamb.cases.MagicConstants.tableLookupSafe:(I)I" ()
      :"jpamb.cases.MagicConstants.twoParams:(II)I" ()
      :"jpamb.cases.MagicConstants.twoParamsSafe:(II)I" ()
      :"jpamb.cases.MagicConstants.unreachableRange:(I)V" ()
      :"jpamb.cases.Operators.branchRemainder:(ZI)I" ()
      :"jpamb.cases.Operators.directRemainder:(II)I" ()
      :"jpamb.cases.Operators.divisionChain:(IIII)I" ()
      :"jpamb.cases.Operators.multiplyForDivisor:(II)I" ()
      :"jpamb.cases.Operators.negatedDivisor:(I)I" ()
      :"jpamb.cases.Overflow.arrayIndexAfterOverflow:(I)I" ()
      :"jpamb.cases.Randomness.branchOverlap:(Ljpamb/utils/Smith;)V" ()
      :"jpamb.cases.Randomness.compareInts:(Ljpamb/utils/Smith;)V" ()
      :"jpamb.cases.Randomness.draw34Bits:(Ljpamb/utils/Smith;)V" ()
      :"jpamb.cases.Randomness.drawDependsOnArg:(ILjpamb/utils/Smith;)I" ()
      :"jpamb.cases.Randomness.drawInCallee:(Ljpamb/utils/Smith;)V" ()
      :"jpamb.cases.Randomness.drawInt:(Ljpamb/utils/Smith;)V" ()
      :"jpamb.cases.Randomness.drawIntOverflow:(Ljpamb/utils/Smith;)V" ()
      :"jpamb.cases.Randomness.loopUntilHeads:(Ljpamb/utils/Smith;)V" ()
      :"jpamb.cases.Randomness.randomBranch:(Ljpamb/utils/Smith;)V" ()
      :"jpamb.cases.Randomness.randomIndex:(Ljpamb/utils/Smith;)V" ()
      :"jpamb.cases.Randomness.randomNull:(Ljpamb/utils/Smith;)V" ()
      :"jpamb.cases.Randomness.spinOnTails:(Ljpamb/utils/Smith;)V" ()
      :"jpamb.cases.Randomness.twoDraws:(Ljpamb/utils/Smith;)V" ()
      :"jpamb.cases.Simple.ConstantExtractionCheck:(ILjava/lang/String;)V" ()
      :"jpamb.cases.Simple.assertBoolean:(Z)V" ()
      :"jpamb.cases.Simple.assertFalse:()V" ()
      :"jpamb.cases.Simple.assertInteger:(I)V" ()
      :"jpamb.cases.Simple.assertPositive:(I)V" ()
      :"jpamb.cases.Simple.assertTrue:()V" ()
      :"jpamb.cases.Simple.branchDivision:(ZI)I" ()
      :"jpamb.cases.Simple.checkBeforeAssert:(I)V" ()
      :"jpamb.cases.Simple.checkBeforeDivideByN2:(I)I" ()
      :"jpamb.cases.Simple.checkBeforeDivideByN:(I)I" ()
      :"jpamb.cases.Simple.directDivision:(II)I" ()
      :"jpamb.cases.Simple.divideByN:(I)I" ()
      :"jpamb.cases.Simple.divideByNMinus10054203:(I)I" ()
      :"jpamb.cases.Simple.divideByZero:()I" ()
      :"jpamb.cases.Simple.divideZeroByZero:(II)I" ()
      :"jpamb.cases.Simple.doNothing:()V" ()
      :"jpamb.cases.Simple.earlyReturn:()I" ()
      :"jpamb.cases.Simple.guardedDivision:(I)I" ()
      :"jpamb.cases.Simple.integerRangeBoundary:(I)V" ()
      :"jpamb.cases.Simple.justAdd:(II)I" ()
      :"jpamb.cases.Simple.justMulitply:(II)I" ()
      :"jpamb.cases.Simple.justReturn:()I" ()
      :"jpamb.cases.Simple.justReturnNothing:()V" ()
      :"jpamb.cases.Simple.multiError:(Z)I" ()
      :"jpamb.cases.Simple.nestedBranchDivision:(II)I" ()
      :"jpamb.cases.Simple.nestedConstantCoverage:(III)V" ()
      :"jpamb.cases.Simple.selectedDivisor:(ZII)I" ()
      :"jpamb.cases.Simple.subtractForDivisor:(II)I" ()
      :"jpamb.cases.Strings.checkComplexSequence:(Ljava/lang/String;)V" ()
      :"jpamb.cases.Strings.checkExtension:(Ljava/lang/String;)V" ()
      :"jpamb.cases.Strings.sayHello2:(Ljava/lang/String;)V" ()
      :"jpamb.cases.Strings.sayHello3:(Ljava/lang/String;)V" ()
      :"jpamb.cases.Strings.sayHello:(Ljava/lang/String;)V" ()
      :"jpamb.cases.Tricky.collatz:(I)V" ()
      :"jpamb.cases.advanced.CWE470.strict_safe_dispatcher:(Ljava/lang/String;)V" ()
      :"jpamb.cases.advanced.CWE470.unsafe_dispatcher:(Ljava/lang/String;)V" ()
      :"jpamb.cases.advanced.CWE470.weak_dispatcher:(Ljava/lang/String;)V" ()
      :"jpamb.cases.advanced.CWE502.blacklist_deserialization:(Ljava/lang/String;)V" ()
      :"jpamb.cases.advanced.CWE502.insecure_deserialization:(Ljava/lang/String;)V" ()
      :"jpamb.cases.advanced.CWE502.whitelist_deserialization:(Ljava/lang/String;)V" ()
    )
    :iterations 3
    :timeout 5.0
  )
  :results (
    :"jpamb.cases.Arrays.arrayContent:()V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 89136877
          :relative 1.15114099132018
        )
        :calibrates (6346650 6241051)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 117625613
          :relative 1.3016140954800917
        )
        :calibrates (5839169 5907583)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 92504628
          :relative 1.254024776751029
        )
        :calibrates (5966561 4341303)
      ))
    :"jpamb.cases.Arrays.arrayContentAboveMinus13:()V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 84287165
          :relative 1.147429675789879
        )
        :calibrates (6044489 5960500)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 99460367
          :relative 1.2147321514201603
        )
        :calibrates (5862088 6270345)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 91018645
          :relative 1.3166506109440081
        )
        :calibrates (4172273 4608035)
      ))
    :"jpamb.cases.Arrays.arrayFillUntilEqual:()V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 90377700
          :relative 1.1817437389440117
        )
        :calibrates (5841108 6053429)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 98905307
          :relative 1.1834382145790072
        )
        :calibrates (6729507 6236653)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 123820131
          :relative 1.2036340746680072
        )
        :calibrates (7616879 7877964)
      ))
    :"jpamb.cases.Arrays.arrayInBounds:()V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 89749540
          :relative 1.183793377162162
        )
        :calibrates (5820332 5935919)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 88468378
          :relative 1.1499393664481568
        )
        :calibrates (6605912 5922000)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 109763968
          :relative 1.166670330457209
        )
        :calibrates (7541965 7414173)
      ))
    :"jpamb.cases.Arrays.arrayIndexValue:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 94282383
          :relative 1.1934273720204818
        )
        :calibrates (5808328 6270733)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 101623726
          :relative 1.2378528729324392
        )
        :calibrates (5810219 5943417)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 106661226
          :relative 1.1593082461236013
        )
        :calibrates (7293767 7488067)
      ))
    :"jpamb.cases.Arrays.arrayIsNull:()V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" npyes
            :ok no
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 95823362
          :relative 1.199078766363404
        )
        :calibrates (6165279 5952489)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" npyes
            :ok no
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 96040650
          :relative 1.2018697222570642
        )
        :calibrates (5825744 6241702)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" npyes
            :ok no
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 92611703
          :relative 1.101465330723
        )
        :calibrates (7454966 7208294)
      ))
    :"jpamb.cases.Arrays.arrayIsNullLength:()V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" npyes
            :ok no
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 93304545
          :relative 1.199427793799634
        )
        :calibrates (5872535 5917226)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" npyes
            :ok no
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 95023119
          :relative 1.2062605027951068
        )
        :calibrates (5827728 5991763)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" npyes
            :ok no
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 113928489
          :relative 1.2878733978609713
        )
        :calibrates (7030164 4713103)
      ))
    :"jpamb.cases.Arrays.arrayLength:()V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 98214907
          :relative 1.2835728019617092
        )
        :calibrates (5823920 4400404)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 96896617
          :relative 1.2113320509041858
        )
        :calibrates (5940927 5971673)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 98845583
          :relative 1.3362567960959095
        )
        :calibrates (4546210 4568240)
      ))
    :"jpamb.cases.Arrays.arrayLoop:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 87120930
          :relative 1.3116897878411138
        )
        :calibrates (4229853 4271004)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 92063847
          :relative 1.1930230671140627
        )
        :calibrates (5840167 5965650)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 91962342
          :relative 1.204710539085269
        )
        :calibrates (4427282 7052390)
      ))
    :"jpamb.cases.Arrays.arrayNotEmpty:([I)V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 89621183
          :relative 1.2411265981935065
        )
        :calibrates (4192677 6094923)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 101096112
          :relative 1.2226880556248139
        )
        :calibrates (5915093 6193018)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 137004790
          :relative 1.289583277912312
        )
        :calibrates (6934593 7131791)
      ))
    :"jpamb.cases.Arrays.arrayOutOfBounds:()V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 86362577
          :relative 1.1589270114503833
        )
        :calibrates (6018159 5961062)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 100127498
          :relative 1.1930337598367542
        )
        :calibrates (6752737 6086807)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 99550855
          :relative 1.1445249467596434
        )
        :calibrates (7080767 7193376)
      ))
    :"jpamb.cases.Arrays.arraySometimesNull:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 88384412
          :relative 1.3222936502928917
        )
        :calibrates (4184960 4231162)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 84331484
          :relative 1.0542454289815142
        )
        :calibrates (8563216 6322657)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 96494438
          :relative 1.1309062074033258
        )
        :calibrates (7116248 7160394)
      ))
    :"jpamb.cases.Arrays.arraySpellsHello:([C)V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 89934145
          :relative 1.2494698076102293
        )
        :calibrates (4184612 5942481)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 89801335
          :relative 1.179099595844954
        )
        :calibrates (5900482 5990376)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 99443541
          :relative 1.141344331931747
        )
        :calibrates (7126031 7237534)
      ))
    :"jpamb.cases.Arrays.arraySumIsLarge:([I)V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 92018238
          :relative 1.1842780709936376
        )
        :calibrates (6035781 6004201)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 92618940
          :relative 1.1927836041526545
        )
        :calibrates (5858002 6025548)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 99147936
          :relative 1.1418841056844016
        )
        :calibrates (7109938 7193142)
      ))
    :"jpamb.cases.Arrays.arraySumIsLargeInt:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 92958164
          :relative 1.1958928431176354
        )
        :calibrates (5899452 5942538)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 94333986
          :relative 1.206838312906
        )
        :calibrates (5823215 5894957)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 102323373
          :relative 1.149710497870823
        )
        :calibrates (7116297 7381244)
      ))
    :"jpamb.cases.Arrays.binarySearch:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 94676700
          :relative 1.2023965352742894
        )
        :calibrates (5906078 5975567)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 95557552
          :relative 1.2027894735920315
        )
        :calibrates (5810285 6171059)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 108638036
          :relative 1.1745647163708486
        )
        :calibrates (7154583 7381493)
      ))
    :"jpamb.cases.Arrays.secretThenDivide:([C)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 91081236
          :relative 1.1850535017359274
        )
        :calibrates (5899383 5996739)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 100545267
          :relative 1.2296238765684506
        )
        :calibrates (5872982 5978366)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 100800751
          :relative 1.1465917770684095
        )
        :calibrates (7039785 7344954)
      ))
    :"jpamb.cases.BitOperations.bitshiftLeft:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 92022907
          :relative 1.190091554504426
        )
        :calibrates (5900920 5979571)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 88219449
          :relative 1.1734898562764566
        )
        :calibrates (5895281 5937981)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 98418880
          :relative 1.1384522708361398
        )
        :calibrates (7109820 7200724)
      ))
    :"jpamb.cases.BitOperations.bitshiftRight:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 110790476
          :relative 1.2393649594862217
        )
        :calibrates (6747584 6021727)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 87533319
          :relative 1.171502795314009
        )
        :calibrates (5825337 5969735)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 101378726
          :relative 1.1540734109053905
        )
        :calibrates (7051142 7168983)
      ))
    :"jpamb.cases.BitOperations.bitshiftUnsignedRight:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 88780637
          :relative 1.1807824935306912
        )
        :calibrates (5836496 5873743)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 93696185
          :relative 1.201458801490781
        )
        :calibrates (5826960 5957050)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 113229147
          :relative 1.2079750444363826
        )
        :calibrates (7033985 6994578)
      ))
    :"jpamb.cases.BitOperations.bitwiseAnd:(II)V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 89117987
          :relative 1.181176732574091
        )
        :calibrates (5846080 5897990)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 91103991
          :relative 1.186441515428684
        )
        :calibrates (5886661 5974464)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 99518492
          :relative 1.1575807559394313
        )
        :calibrates (6844324 7002591)
      ))
    :"jpamb.cases.BitOperations.bitwiseNot:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 94003209
          :relative 1.266713641032553
        )
        :calibrates (5903067 4270167)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 93065560
          :relative 1.1967396146123401
        )
        :calibrates (5830381 6002197)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 94357329
          :relative 1.1323826641775803
        )
        :calibrates (6777010 7136060)
      ))
    :"jpamb.cases.BitOperations.bitwiseOr:(II)V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 99021276
          :relative 1.2907646760349707
        )
        :calibrates (4219798 5919172)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 91984741
          :relative 1.192142969415698
        )
        :calibrates (5848462 5971139)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 97261247
          :relative 1.1349202653317052
        )
        :calibrates (6999925 7257778)
      ))
    :"jpamb.cases.BitOperations.drawInt:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 96583532
          :relative 1.2137622514075115
        )
        :calibrates (5836667 5971183)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 96575454
          :relative 1.2147502101677587
        )
        :calibrates (5813583 5966451)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 98060945
          :relative 1.1262469343454458
        )
        :calibrates (7010349 7654552)
      ))
    :"jpamb.cases.BitOperations.xor:(II)V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 87610059
          :relative 1.170586448502351
        )
        :calibrates (5834098 5996250)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 88795550
          :relative 1.1779318518535273
        )
        :calibrates (5821210 5968126)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 120384497
          :relative 1.2186197392685292
        )
        :calibrates (7383412 7170536)
      ))
    :"jpamb.cases.Calls.allPrimesArePositive:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 97237200
          :relative 1.2852543248081865
        )
        :calibrates (5803171 4280255)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 93000001
          :relative 1.1831781798635788
        )
        :calibrates (6050046 6149250)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 94353255
          :relative 1.0736719905497
        )
        :calibrates (8826331 7099969)
      ))
    :"jpamb.cases.Calls.callsAssertFalse:()V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 84147965
          :relative 1.297657224728635
        )
        :calibrates (4226093 4254308)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 89405711
          :relative 1.1563157484248097
        )
        :calibrates (6586165 5889954)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 97820514
          :relative 1.1347406740528891
        )
        :calibrates (7061644 7283974)
      ))
    :"jpamb.cases.Calls.callsAssertFib:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 104371755
          :relative 1.2963348357535072
        )
        :calibrates (4181372 6369252)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 94749723
          :relative 1.2039548349992937
        )
        :calibrates (5806855 6041365)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 101465836
          :relative 1.1486983905799468
        )
        :calibrates (7237807 7171777)
      ))
    :"jpamb.cases.Calls.callsAssertIf:(Z)V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 85086111
          :relative 1.1529358965643235
        )
        :calibrates (5894274 6071830)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 89529118
          :relative 1.1670354885685041
        )
        :calibrates (5968606 6220134)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 103485289
          :relative 1.161478796087168
        )
        :calibrates (7114808 7155384)
      ))
    :"jpamb.cases.Calls.callsAssertIfWithTrue:()V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 95270719
          :relative 1.2106733218797592
        )
        :calibrates (5821157 5909332)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 87954007
          :relative 1.1701131946524304
        )
        :calibrates (5960813 5928929)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 100218637
          :relative 1.1493261307040532
        )
        :calibrates (7009953 7201954)
      ))
    :"jpamb.cases.Calls.callsAssertTrue:()V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 92637321
          :relative 1.1784794629753295
        )
        :calibrates (6271288 6012619)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 97437605
          :relative 1.1914582977842239
        )
        :calibrates (6627409 5912613)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 101837417
          :relative 1.1502605815729663
        )
        :calibrates (7135914 7274511)
      ))
    :"jpamb.cases.Calls.callsBowtie:(II)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 93551609
          :relative 1.194250375383163
        )
        :calibrates (5844658 6118088)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 101099584
          :relative 1.2224231463933963
        )
        :calibrates (5957695 6158220)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 106002702
          :relative 1.1655126902642126
        )
        :calibrates (7123140 7359050)
      ))
    :"jpamb.cases.Calls.callsCallChain:(II)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 91172144
          :relative 1.1899660663518548
        )
        :calibrates (5815151 5958905)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 100227089
          :relative 1.2286259245244557
        )
        :calibrates (5923211 5917811)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 98195454
          :relative 1.1260590519902482
        )
        :calibrates (7074898 7616473)
      ))
    :"jpamb.cases.Calls.callsCallCycle:(II)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 92462109
          :relative 1.1948824777180134
        )
        :calibrates (5896038 5910194)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 95053932
          :relative 1.2060848743675452
        )
        :calibrates (5900455 5927651)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 105896922
          :relative 1.1559107160750408
        )
        :calibrates (7607866 7183307)
      ))
    :"jpamb.cases.Calls.callsCallCycleFork:(II)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 92979076
          :relative 1.198336960751585
        )
        :calibrates (5824799 5953383)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 98653861
          :relative 1.2229134913753352
        )
        :calibrates (5825367 5984108)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 100916123
          :relative 1.1540301808217128
        )
        :calibrates (7029046 7127600)
      ))
    :"jpamb.cases.Calls.callsCallCycleLoop:(II)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 91035789
          :relative 1.1859669833255875
        )
        :calibrates (5894160 5971043)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 92844398
          :relative 1.1949412579202523
        )
        :calibrates (5884250 5969191)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 102608678
          :relative 1.154521770590517
        )
        :calibrates (7202718 7175078)
      ))
    :"jpamb.cases.Calls.callsCallCycleNext:(II)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 99733239
          :relative 1.2013012239597034
        )
        :calibrates (5833203 6714629)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 87346315
          :relative 1.1597548957041002
        )
        :calibrates (5820730 6271870)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 100402367
          :relative 1.1459752239257357
        )
        :calibrates (7129782 7218461)
      ))
    :"jpamb.cases.Calls.callsDiamond:(I)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 99792003
          :relative 1.2236713902232081
        )
        :calibrates (5946046 5978843)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 93099694
          :relative 1.192396919739718
        )
        :calibrates (6038803 5917071)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 99448895
          :relative 1.1394427878811835
        )
        :calibrates (7087628 7339742)
      ))
    :"jpamb.cases.Calls.callsDumbbell:(II)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 131553511
          :relative 1.31990961361504
        )
        :calibrates (6245970 6349745)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 109159272
          :relative 1.2689863823861611
        )
        :calibrates (5874472 5877324)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 112551542
          :relative 1.196466602538317
        )
        :calibrates (7136900 7182171)
      ))
    :"jpamb.cases.Calls.callsTadpole:(II)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 105754095
          :relative 1.1761410960471437
        )
        :calibrates (6213955 7884973)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 95568377
          :relative 1.2085450033989462
        )
        :calibrates (5850154 5974793)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 94537483
          :relative 1.123863825962995
        )
        :calibrates (7296786 6918978)
      ))
    :"jpamb.cases.Calls.callsWheel:(II)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 123068758
          :relative 1.3191073337654937
        )
        :calibrates (5918947 5886175)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 94317000
          :relative 1.202276891657393
        )
        :calibrates (5818363 6021402)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 100002561
          :relative 1.148968383799223
        )
        :calibrates (6974515 7218437)
      ))
    :"jpamb.cases.Calls.divideViaHelper:(I)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 91410539
          :relative 1.17128507734342
        )
        :calibrates (6267834 6055868)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 92633357
          :relative 1.181409909309748
        )
        :calibrates (5821577 6379200)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 107303356
          :relative 1.179968049982808
        )
        :calibrates (7041325 7138643)
      ))
    :"jpamb.cases.Calls.divisionThroughHelper:(II)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 96148512
          :relative 1.2137222214133694
        )
        :calibrates (5886994 5868756)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 86669099
          :relative 1.21139153134836
        )
        :calibrates (6165541 4488215)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 96778312
          :relative 1.1322426916814703
        )
        :calibrates (7005168 7269478)
      ))
    :"jpamb.cases.Dependent.badNormalizedDistance:(II)I" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 90043728
          :relative 1.1816227900757514
        )
        :calibrates (5846969 6006915)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 108863362
          :relative 1.3181913881646543
        )
        :calibrates (4182306 6282239)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 101453459
          :relative 1.1562309939781228
        )
        :calibrates (7043563 7116522)
      ))
    :"jpamb.cases.Dependent.combinedGuidance:(III)V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 91884228
          :relative 1.186799497014826
        )
        :calibrates (5953991 5998859)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 87762491
          :relative 1.2424282551413575
        )
        :calibrates (5827811 4216281)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 100008480
          :relative 1.23427803289717
        )
        :calibrates (7057934 4604489)
      ))
    :"jpamb.cases.Dependent.compareEquality:(II)V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 114159940
          :relative 1.2839061960136953
        )
        :calibrates (5897756 5977351)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 90175351
          :relative 1.3144936218155583
        )
        :calibrates (4446526 4295744)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 91198182
          :relative 1.1813613373877279
        )
        :calibrates (4522160 7490933)
      ))
    :"jpamb.cases.Dependent.divisionLoop:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 84842591
          :relative 1.1538831471761326
        )
        :calibrates (5945022 5960838)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 83043572
          :relative 1.2007039914350965
        )
        :calibrates (4253742 6208675)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 139755100
          :relative 1.271690268857924
        )
        :calibrates (7695429 7256850)
      ))
    :"jpamb.cases.Dependent.doubleIsAlwaysEven:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 91037310
          :relative 1.1879668610178562
        )
        :calibrates (5861303 5949585)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 88697520
          :relative 1.1542940765460663
        )
        :calibrates (6150240 6284806)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 113419590
          :relative 1.330599891966581
        )
        :calibrates (6090489 4504931)
      ))
    :"jpamb.cases.Dependent.normalizedDistance:(II)I" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 89550191
          :relative 1.1844704915009288
        )
        :calibrates (5820238 5891626)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 86932881
          :relative 1.10893569177674
        )
        :calibrates (7211033 6318362)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 133037458
          :relative 1.3623663407938194
        )
        :calibrates (4391041 7160438)
      ))
    :"jpamb.cases.Dependent.safeDivByN:(I)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 88159153
          :relative 1.1753355667847003
        )
        :calibrates (5808301 5966724)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 88198674
          :relative 1.1540936339704322
        )
        :calibrates (6361575 6009243)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 95740990
          :relative 1.1170081901461717
        )
        :calibrates (7025264 7600539)
      ))
    :"jpamb.cases.Extended.safeDifferenceChain:(III)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 92840937
          :relative 1.2008428923739907
        )
        :calibrates (5822079 5870939)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 94588890
          :relative 1.1977357488128662
        )
        :calibrates (5886350 6112355)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 92487626
          :relative 1.10666274479525
        )
        :calibrates (7520160 6949252)
      ))
    :"jpamb.cases.Extended.safeLoopAccumulation:(III)I" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 96479535
          :relative 1.2091255511937524
        )
        :calibrates (5928588 5993152)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 92598599
          :relative 1.1811430309804738
        )
        :calibrates (6314176 5889520)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 115349844
          :relative 1.3016470085118135
        )
        :calibrates (6881873 4636735)
      ))
    :"jpamb.cases.Extended.safeNestedLoopDivision:(III)I" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 88758035
          :relative 1.1432842928203548
        )
        :calibrates (6425971 6337047)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 96260946
          :relative 1.2072761156133862
        )
        :calibrates (5875960 6069531)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 93394204
          :relative 1.3105922134772587
        )
        :calibrates (4553952 4582082)
      ))
    :"jpamb.cases.Extended.safeSelectedDivisor:(ZIII)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 97137027
          :relative 1.2453955760902942
        )
        :calibrates (6818975 4222300)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 96298153
          :relative 1.2136749399165574
        )
        :calibrates (5825405 5949923)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 94334118
          :relative 1.3157510017133978
        )
        :calibrates (4560660 4558352)
      ))
    :"jpamb.cases.Extended.unsafeComputedRemainder:(IIIII)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 88531919
          :relative 1.3187217799012287
        )
        :calibrates (4233664 4266124)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 94534762
          :relative 1.2057235784584537
        )
        :calibrates (5822846 5950447)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 91338179
          :relative 1.3154577999195272
        )
        :calibrates (4394287 4441079)
      ))
    :"jpamb.cases.Extended.unsafeLoopOffsetDivisor:(IIII)I" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 86445052
          :relative 1.309571501853934
        )
        :calibrates (4241493 4234657)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 91932489
          :relative 1.193229609869309
        )
        :calibrates (5835193 5948174)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 107246592
          :relative 1.3831152324299847
        )
        :calibrates (4390295 4487360)
      ))
    :"jpamb.cases.Extended.unsafeModeDerivedDivisor:(IIII)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 86996781
          :relative 1.3158512199286738
        )
        :calibrates (4177255 4230537)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 97665095
          :relative 1.219476896657803
        )
        :calibrates (5823629 5960364)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 120689786
          :relative 1.3193553301788286
        )
        :calibrates (4438382 7131933)
      ))
    :"jpamb.cases.Extended.unsafeNestedAffineDivisor:(IIIII)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 102044558
          :relative 1.3019876902325327
        )
        :calibrates (4216361 5965617)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 96606057
          :relative 1.203541062460352
        )
        :calibrates (5827333 6264532)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 113895037
          :relative 1.2092192772858354
        )
        :calibrates (6897647 7173047)
      ))
    :"jpamb.cases.Extended.unsafeNestedLoopDivisor:(IIIII)I" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 94786433
          :relative 1.2461972188679304
        )
        :calibrates (5805365 4948856)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 90101917
          :relative 1.1610072591365652
        )
        :calibrates (6530844 5907334)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 138249739
          :relative 1.2969075893338664
        )
        :calibrates (7094527 6862301)
      ))
    :"jpamb.cases.Loops.decrementLoop:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 86009796
          :relative 1.2346638174505207
        )
        :calibrates (4162178 5858892)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 90767567
          :relative 1.1890609696071173
        )
        :calibrates (5831057 5915206)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 88686753
          :relative 1.1068398446334227
        )
        :calibrates (6893377 6975743)
      ))
    :"jpamb.cases.Loops.doWhileDivision:(II)I" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 86117053
          :relative 1.1655760637362385
        )
        :calibrates (5858170 5905507)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 93616949
          :relative 1.1776997844171755
        )
        :calibrates (5806892 6629222)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 92884980
          :relative 1.1302792916363407
        )
        :calibrates (6843715 6918749)
      ))
    :"jpamb.cases.Loops.forLoopDivision:(II)I" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 114862351
          :relative 1.291039007164885
        )
        :calibrates (5806480 5947060)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 86744054
          :relative 1.210195163425365
        )
        :calibrates (6462250 4230134)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 96144494
          :relative 1.1481810066829554
        )
        :calibrates (6776894 6893260)
      ))
    :"jpamb.cases.Loops.forever:()V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok no
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 113281623
          :relative 1.2693392257082923
        )
        :calibrates (5869172 6316521)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok no
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 91810594
          :relative 1.2571791903912677
        )
        :calibrates (4192781 5963708)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok no
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 99278506
          :relative 1.159308553455932
        )
        :calibrates (6831154 6927523)
      ))
    :"jpamb.cases.Loops.loopRemainder:(II)I" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 87830001
          :relative 1.2341741467770193
        )
        :calibrates (6026323 4218365)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 91915631
          :relative 1.1861165385363197
        )
        :calibrates (5799424 6176329)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 101076032
          :relative 1.1672985473567499
        )
        :calibrates (6791422 6961014)
      ))
    :"jpamb.cases.Loops.multiplicationLoop:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 84148049
          :relative 1.3020710392403507
        )
        :calibrates (4166013 4228645)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 115724330
          :relative 1.291474478320759
        )
        :calibrates (5870574 5959302)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 96011908
          :relative 1.2199858163108959
        )
        :calibrates (6908135 4662822)
      ))
    :"jpamb.cases.Loops.nestedLoop:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 86539381
          :relative 1.3040134116864097
        )
        :calibrates (4162968 4431725)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 93823430
          :relative 1.1979692974998135
        )
        :calibrates (5898165 5997042)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 93130664
          :relative 1.165542793932466
        )
        :calibrates (4505425 8217293)
      ))
    :"jpamb.cases.Loops.neverAsserts:()V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok no
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 113163870
          :relative 1.3466783927355288
        )
        :calibrates (4164972 6022335)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok no
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 96366450
          :relative 1.2107263654210576
        )
        :calibrates (5867653 5996302)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok no
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 94987871
          :relative 1.2407430106575994
        )
        :calibrates (6326668 4586608)
      ))
    :"jpamb.cases.Loops.neverDivides:()I" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok no
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 90980632
          :relative 1.1831687847004115
        )
        :calibrates (5905321 6029342)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok no
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 95808599
          :relative 1.2011898213347552
        )
        :calibrates (5799989 6257161)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok no
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 96522373
          :relative 1.3239725987198045
        )
        :calibrates (4592313 4563257)
      ))
    :"jpamb.cases.Loops.safeNestedBranchDivision:(III)I" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 94308867
          :relative 1.2041191491475995
        )
        :calibrates (5915754 5872877)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 91844718
          :relative 1.1885521461556137
        )
        :calibrates (5916734 5982857)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 97251412
          :relative 1.2185691493621842
        )
        :calibrates (4523469 7235162)
      ))
    :"jpamb.cases.Loops.terminates:()V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 92119916
          :relative 1.188670065868064
        )
        :calibrates (5867932 6064074)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 96211029
          :relative 1.2084573891209456
        )
        :calibrates (5915316 5991550)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 98702177
          :relative 1.1355976327930404
        )
        :calibrates (7153585 7292797)
      ))
    :"jpamb.cases.Loops.whileLoopDivision:(II)I" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 101404164
          :relative 1.2377361267597409
        )
        :calibrates (5826423 5904972)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 89795058
          :relative 1.1805371075578786
        )
        :calibrates (5861185 5989551)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 100304159
          :relative 1.147751645483813
        )
        :calibrates (7043949 7231747)
      ))
    :"jpamb.cases.MagicConstants.computedIndex:(I)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 86001630
          :relative 1.1452530481833416
        )
        :calibrates (5843461 6467264)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 93369857
          :relative 1.1891565969846956
        )
        :calibrates (6160675 5919691)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 107094094
          :relative 1.17619296271089
        )
        :calibrates (7168923 7106946)
      ))
    :"jpamb.cases.MagicConstants.derivedNull:(I)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 92261185
          :relative 1.1736387055552244
        )
        :calibrates (5897541 6473616)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 92398303
          :relative 1.1926862437360675
        )
        :calibrates (5808707 6049192)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 96238672
          :relative 1.133597580803927
        )
        :calibrates (6987480 7163354)
      ))
    :"jpamb.cases.MagicConstants.loopAndEquality:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 88890165
          :relative 1.1818864155461757
        )
        :calibrates (5823876 5871045)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 97618902
          :relative 1.221131524784263
        )
        :calibrates (5860635 5872995)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 97822283
          :relative 1.1383342201093645
        )
        :calibrates (7066461 7161202)
      ))
    :"jpamb.cases.MagicConstants.loopDoubling:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 86947789
          :relative 1.2353060784793122
        )
        :calibrates (5888973 4226413)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 89498315
          :relative 1.177977639483918
        )
        :calibrates (5840394 6040995)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 99668238
          :relative 1.1439714527381415
        )
        :calibrates (7030431 7278768)
      ))
    :"jpamb.cases.MagicConstants.loopDoublingSafe:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 87263904
          :relative 1.3121752016923538
        )
        :calibrates (4248700 4256596)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 101671714
          :relative 1.2401719134674039
        )
        :calibrates (5789663 5906899)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 105830793
          :relative 1.254775892355254
        )
        :calibrates (7105458 4666973)
      ))
    :"jpamb.cases.MagicConstants.narrowEquality:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 108104655
          :relative 1.4047205456800658
        )
        :calibrates (4245128 4269268)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 91573127
          :relative 1.1894374979625775
        )
        :calibrates (5886927 5953314)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 104422553
          :relative 1.359188923951033
        )
        :calibrates (4560064 4573397)
      ))
    :"jpamb.cases.MagicConstants.rangeCondition:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 104536331
          :relative 1.3882976109719174
        )
        :calibrates (4246019 4304641)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 93095355
          :relative 1.1791437018908448
        )
        :calibrates (6395363 5930414)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 133599605
          :relative 1.477687947915557
        )
        :calibrates (4537278 4357748)
      ))
    :"jpamb.cases.MagicConstants.squareThreshold:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 102549038
          :relative 1.379354205326545
        )
        :calibrates (4284148 4278486)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 94151607
          :relative 1.2036296097787285
        )
        :calibrates (5857657 5924590)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 96731610
          :relative 1.351113869028354
        )
        :calibrates (4275642 4343907)
      ))
    :"jpamb.cases.MagicConstants.squaredDivisor:(I)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 101205469
          :relative 1.2999404464199293
        )
        :calibrates (4224400 5921569)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 86625197
          :relative 1.1644149803657764
        )
        :calibrates (5906761 5958007)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 98065940
          :relative 1.3536012364325778
        )
        :calibrates (4316435 4372108)
      ))
    :"jpamb.cases.MagicConstants.sumReachesTarget:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 98845355
          :relative 1.2246332005599576
        )
        :calibrates (5827495 5958142)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 101931691
          :relative 1.240015962760284
        )
        :calibrates (5793931 5936751)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 100044475
          :relative 1.2566824040937967
        )
        :calibrates (4333751 6746273)
      ))
    :"jpamb.cases.MagicConstants.tableLookup:(I)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 97074056
          :relative 1.2162473366215212
        )
        :calibrates (5847727 5952377)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 99743107
          :relative 1.2287681137284732
        )
        :calibrates (5862643 5917343)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 97793151
          :relative 1.2323772754695337
        )
        :calibrates (6815494 4638611)
      ))
    :"jpamb.cases.MagicConstants.tableLookupSafe:(I)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 93840919
          :relative 1.1677750520736274
        )
        :calibrates (5826479 6927544)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 90624456
          :relative 1.1848404863082047
        )
        :calibrates (5908994 5933275)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 101794277
          :relative 1.245609898721719
        )
        :calibrates (4463514 7101428)
      ))
    :"jpamb.cases.MagicConstants.twoParams:(II)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 97518769
          :relative 1.1888717525801107
        )
        :calibrates (6592435 6033003)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 92382614
          :relative 1.1814370197732573
        )
        :calibrates (5847501 6319491)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 104125557
          :relative 1.165870747169066
        )
        :calibrates (7076505 7137504)
      ))
    :"jpamb.cases.MagicConstants.twoParamsSafe:(II)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 90776967
          :relative 1.1889441427051017
        )
        :calibrates (5814950 5935690)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 88094741
          :relative 1.220226160855243
        )
        :calibrates (6368747 4242192)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 107749160
          :relative 1.179055190229953
        )
        :calibrates (7029518 7239323)
      ))
    :"jpamb.cases.MagicConstants.unreachableRange:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 93130441
          :relative 1.1967330539575411
        )
        :calibrates (5827369 6013637)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 106397970
          :relative 1.4005518058685251
        )
        :calibrates (4207201 4253601)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 98547370
          :relative 1.1372191726607026
        )
        :calibrates (7222182 7147788)
      ))
    :"jpamb.cases.Operators.branchRemainder:(ZI)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 90756924
          :relative 1.252694786266349
        )
        :calibrates (5860225 4283909)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 118697059
          :relative 1.367614767603736
        )
        :calibrates (4182517 6000001)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 100396837
          :relative 1.1450925075464584
        )
        :calibrates (7263283 7113361)
      ))
    :"jpamb.cases.Operators.directRemainder:(II)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 85710863
          :relative 1.3085350809683274
        )
        :calibrates (4199407 4224834)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 95834958
          :relative 1.2007766684267587
        )
        :calibrates (5786078 6285868)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 96339444
          :relative 1.125144486616205
        )
        :calibrates (7227426 7216646)
      ))
    :"jpamb.cases.Operators.divisionChain:(IIII)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 112904963
          :relative 1.3479654283390539
        )
        :calibrates (4187590 5946333)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 88220485
          :relative 1.1637198239251059
        )
        :calibrates (6162374 5940252)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 104013028
          :relative 1.1591070600785915
        )
        :calibrates (7161172 7260336)
      ))
    :"jpamb.cases.Operators.multiplyForDivisor:(II)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 85822376
          :relative 1.1632709465932105
        )
        :calibrates (5874634 5911180)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 93933214
          :relative 1.1875720135231616
        )
        :calibrates (6237391 5960287)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 105465159
          :relative 1.1622320956767647
        )
        :calibrates (7005612 7512392)
      ))
    :"jpamb.cases.Operators.negatedDivisor:(I)I" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 100543982
          :relative 1.2057573630434473
        )
        :calibrates (5822534 6698169)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 96457325
          :relative 1.2095715001262002
        )
        :calibrates (5900604 6006159)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 109242568
          :relative 1.159999982100784
        )
        :calibrates (7490376 7625103)
      ))
    :"jpamb.cases.Overflow.arrayIndexAfterOverflow:(I)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 86517303
          :relative 1.155533379462346
        )
        :calibrates (6162235 5932590)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 90518599
          :relative 1.1838210204312656
        )
        :calibrates (5801401 6054834)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 104896807
          :relative 1.1584316249755657
        )
        :calibrates (7389882 7176800)
      ))
    :"jpamb.cases.Randomness.branchOverlap:(Ljpamb/utils/Smith;)V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 90438100
          :relative 1.1785726741949483
        )
        :calibrates (6075882 5913830)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 87185324
          :relative 1.1709598256995322
        )
        :calibrates (5879809 5883068)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 101613876
          :relative 1.1469129493445365
        )
        :calibrates (7145253 7344803)
      ))
    :"jpamb.cases.Randomness.compareInts:(Ljpamb/utils/Smith;)V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 90556953
          :relative 1.1861270981664431
        )
        :calibrates (5824429 5974014)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 93855135
          :relative 1.2039804045191407
        )
        :calibrates (5820843 5914820)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 101512709
          :relative 1.1429898002945484
        )
        :calibrates (7397528 7209458)
      ))
    :"jpamb.cases.Randomness.draw34Bits:(Ljpamb/utils/Smith;)V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 89360715
          :relative 1.1768367932157229
        )
        :calibrates (5865630 6028696)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 96776181
          :relative 1.214357177535643
        )
        :calibrates (5824418 5990788)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 101558003
          :relative 1.1521901677610167
        )
        :calibrates (7038511 7268667)
      ))
    :"jpamb.cases.Randomness.drawDependsOnArg:(ILjpamb/utils/Smith;)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 90724377
          :relative 1.1824128505765283
        )
        :calibrates (5953477 5968304)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 92690129
          :relative 1.1976917992273823
        )
        :calibrates (5811561 5947474)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 106086134
          :relative 1.251891882669237
        )
        :calibrates (7117472 4761989)
      ))
    :"jpamb.cases.Randomness.drawInCallee:(Ljpamb/utils/Smith;)V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 92314253
          :relative 1.1927351294323332
        )
        :calibrates (5876561 5969218)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 92462579
          :relative 1.187277898258153
        )
        :calibrates (5989051 6025792)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 98460331
          :relative 1.2969060386826938
        )
        :calibrates (4672497 5267477)
      ))
    :"jpamb.cases.Randomness.drawInt:(Ljpamb/utils/Smith;)V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 97468145
          :relative 1.2180727092778507
        )
        :calibrates (5932267 5866048)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 93049494
          :relative 1.194762402161059
        )
        :calibrates (5843535 6040984)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 137726551
          :relative 1.3712473983830902
        )
        :calibrates (4648996 7067568)
      ))
    :"jpamb.cases.Randomness.drawIntOverflow:(Ljpamb/utils/Smith;)V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 93807281
          :relative 1.1811505434283398
        )
        :calibrates (6351701 6011075)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 121673706
          :relative 1.3127779476527726
        )
        :calibrates (5909261 5933386)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 110487593
          :relative 1.185876436036798
        )
        :calibrates (7253588 7149880)
      ))
    :"jpamb.cases.Randomness.loopUntilHeads:(Ljpamb/utils/Smith;)V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 92507580
          :relative 1.2608647332377372
        )
        :calibrates (5820173 4326942)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 87272882
          :relative 1.2370698045208852
        )
        :calibrates (5841806 4270251)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 103049537
          :relative 1.1573966506445432
        )
        :calibrates (7183140 7161161)
      ))
    :"jpamb.cases.Randomness.randomBranch:(Ljpamb/utils/Smith;)V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 119153877
          :relative 1.36584586049016
        )
        :calibrates (4303155 5960270)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 89362362
          :relative 1.2432462711020467
        )
        :calibrates (4257035 5950911)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 111173827
          :relative 1.1930025437771206
        )
        :calibrates (7079700 7177361)
      ))
    :"jpamb.cases.Randomness.randomIndex:(Ljpamb/utils/Smith;)V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 111805781
          :relative 1.3146392066146821
        )
        :calibrates (6484509 4351143)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 93866060
          :relative 1.2027130126578163
        )
        :calibrates (5815365 5955966)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 104007477
          :relative 1.2503794360813199
        )
        :calibrates (7066844 4620481)
      ))
    :"jpamb.cases.Randomness.randomNull:(Ljpamb/utils/Smith;)V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 106359845
          :relative 1.3991399268977431
        )
        :calibrates (4215054 4270257)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 95533663
          :relative 1.213052756633674
        )
        :calibrates (5788915 5909679)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 91410388
          :relative 1.3109833915860336
        )
        :calibrates (4439030 4494892)
      ))
    :"jpamb.cases.Randomness.spinOnTails:(Ljpamb/utils/Smith;)V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 84429732
          :relative 1.299569038659447
        )
        :calibrates (4221978 4249445)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 89150227
          :relative 1.1831567533604124
        )
        :calibrates (5793531 5901347)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 115905469
          :relative 1.2970198569922997
        )
        :calibrates (4424263 7273803)
      ))
    :"jpamb.cases.Randomness.twoDraws:(Ljpamb/utils/Smith;)V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 88340969
          :relative 1.2387570458344344
        )
        :calibrates (4233799 5962325)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 96102936
          :relative 1.211735353506417
        )
        :calibrates (5823141 5980916)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 136880428
          :relative 1.1935163806297193
        )
        :calibrates (7176899 10356050)
      ))
    :"jpamb.cases.Simple.ConstantExtractionCheck:(ILjava/lang/String;)V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 82364779
          :relative 1.2109719487228678
        )
        :calibrates (5888680 4245756)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 92167739
          :relative 1.167062489571729
        )
        :calibrates (6549672 5997517)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 191038332
          :relative 1.288062442147964
        )
        :calibrates (10495099 9187755)
      ))
    :"jpamb.cases.Simple.assertBoolean:(Z)V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 83597051
          :relative 1.2975073505953183
        )
        :calibrates (4191864 4235924)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 87001139
          :relative 1.1599994405587144
        )
        :calibrates (6088640 5949392)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 157709717
          :relative 1.266843391114151
        )
        :calibrates (8719734 8342860)
      ))
    :"jpamb.cases.Simple.assertFalse:()V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok no
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 102815822
          :relative 1.3064065986106153
        )
        :calibrates (4202753 5952327)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok no
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 96327787
          :relative 1.1982421581561487
        )
        :calibrates (6240410 5964636)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok no
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 119093377
          :relative 1.1782302018607504
        )
        :calibrates (8334635 7466468)
      ))
    :"jpamb.cases.Simple.assertInteger:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 94138277
          :relative 1.1998605683995514
        )
        :calibrates (5836482 6046780)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 87338965
          :relative 1.1697625557995535
        )
        :calibrates (5886088 5930048)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 95108410
          :relative 1.1037179985448997
        )
        :calibrates (7597612 7383047)
      ))
    :"jpamb.cases.Simple.assertPositive:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 93511245
          :relative 1.1990277940272493
        )
        :calibrates (5824566 6002201)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 91933963
          :relative 1.1751386999926194
        )
        :calibrates (5942419 6342358)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 100112884
          :relative 1.1325776637834855
        )
        :calibrates (7314287 7440818)
      ))
    :"jpamb.cases.Simple.assertTrue:()V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 92699522
          :relative 1.195693283308922
        )
        :calibrates (5821494 5992975)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 84089041
          :relative 1.195408256712359
        )
        :calibrates (6272120 4451987)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 114370173
          :relative 1.1933982041934528
        )
        :calibrates (7278771 7374837)
      ))
    :"jpamb.cases.Simple.branchDivision:(ZI)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 89718694
          :relative 1.1814425299713838
        )
        :calibrates (5826830 5989168)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 85923417
          :relative 1.2287330035115833
        )
        :calibrates (4208565 5940091)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 111338950
          :relative 1.2013334145760948
        )
        :calibrates (7036644 6970310)
      ))
    :"jpamb.cases.Simple.checkBeforeAssert:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 92304347
          :relative 1.189908460236409
        )
        :calibrates (5909330 6012521)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 86733897
          :relative 1.1657932853912942
        )
        :calibrates (5901431 5940583)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 109039664
          :relative 1.198252765546524
        )
        :calibrates (6804681 7010664)
      ))
    :"jpamb.cases.Simple.checkBeforeDivideByN2:(I)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 93408228
          :relative 1.198369961845055
        )
        :calibrates (5867398 5964248)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 88102376
          :relative 1.164124614649376
        )
        :calibrates (5910534 6164629)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 100320347
          :relative 1.1580352912933805
        )
        :calibrates (6804968 7138915)
      ))
    :"jpamb.cases.Simple.checkBeforeDivideByN:(I)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 96017479
          :relative 1.214343048686244
        )
        :calibrates (5804586 5918373)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 90748820
          :relative 1.18534185698917
        )
        :calibrates (5867971 5976867)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 105684192
          :relative 1.1611607210979669
        )
        :calibrates (7372140 7211949)
      ))
    :"jpamb.cases.Simple.directDivision:(II)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 89567300
          :relative 1.1804804414135588
        )
        :calibrates (5897100 5925120)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 95461068
          :relative 1.208018887269491
        )
        :calibrates (5827156 5998831)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 98674156
          :relative 1.1447085798130765
        )
        :calibrates (7022695 7119761)
      ))
    :"jpamb.cases.Simple.divideByN:(I)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 91392041
          :relative 1.1850378299013478
        )
        :calibrates (5886112 6051035)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 91023464
          :relative 1.1833218520827933
        )
        :calibrates (5859805 6076269)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 100618708
          :relative 1.1617265923776536
        )
        :calibrates (6791471 7075517)
      ))
    :"jpamb.cases.Simple.divideByNMinus10054203:(I)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 91031215
          :relative 1.1892238656678733
        )
        :calibrates (5816810 5959154)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 93367504
          :relative 1.1717739796755708
        )
        :calibrates (5845107 6728265)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 103616571
          :relative 1.1647362461509567
        )
        :calibrates (7117344 7064182)
      ))
    :"jpamb.cases.Simple.divideByZero:()I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok no
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 93668958
          :relative 1.19865775089922
        )
        :calibrates (5894896 5961916)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok no
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 91819396
          :relative 1.1805765953039569
        )
        :calibrates (5836710 6280087)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok no
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 96480952
          :relative 1.150479957773051
        )
        :calibrates (6765486 6880082)
      ))
    :"jpamb.cases.Simple.divideZeroByZero:(II)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 91207758
          :relative 1.1881987830763154
        )
        :calibrates (5834800 5991884)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 97100533
          :relative 1.1871924266466873
        )
        :calibrates (6657210 5962785)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 104304426
          :relative 1.1788568705354727
        )
        :calibrates (6808523 7010453)
      ))
    :"jpamb.cases.Simple.doNothing:()V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 95115675
          :relative 1.2063010531688876
        )
        :calibrates (5844474 5985425)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 108811357
          :relative 1.2354019567372996
        )
        :calibrates (6074533 6581636)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 105337428
          :relative 1.1741309089865428
        )
        :calibrates (6922940 7185591)
      ))
    :"jpamb.cases.Simple.earlyReturn:()I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 92172159
          :relative 1.1867645379481366
        )
        :calibrates (5958796 6032475)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 86327769
          :relative 1.2120240134494238
        )
        :calibrates (6193876 4402479)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 99134820
          :relative 1.1554508763999791
        )
        :calibrates (6951349 6909995)
      ))
    :"jpamb.cases.Simple.guardedDivision:(I)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 142455165
          :relative 1.4472148830490177
        )
        :calibrates (5886229 4287808)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 90683728
          :relative 1.331672432666296
        )
        :calibrates (4210958 4239630)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 94356466
          :relative 1.1365536738067046
        )
        :calibrates (6761115 7018846)
      ))
    :"jpamb.cases.Simple.integerRangeBoundary:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 97958920
          :relative 1.1830771467417056
        )
        :calibrates (4799396 8053377)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 90025624
          :relative 1.3285603970107054
        )
        :calibrates (4200176 4249416)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 101374569
          :relative 1.1602355990890003
        )
        :calibrates (6882417 7136789)
      ))
    :"jpamb.cases.Simple.justAdd:(II)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 139568558
          :relative 1.2470421573049255
        )
        :calibrates (7496255 8308051)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 93008812
          :relative 1.2341251151698946
        )
        :calibrates (4489385 6360596)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 94288455
          :relative 1.1260506471103997
        )
        :calibrates (6828370 7278734)
      ))
    :"jpamb.cases.Simple.justMulitply:(II)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 119292656
          :relative 1.206551080432925
        )
        :calibrates (8202807 6625536)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 88908413
          :relative 1.1347687057754303
        )
        :calibrates (6868164 6169631)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 113771299
          :relative 1.2027005553214987
        )
        :calibrates (7022200 7245769)
      ))
    :"jpamb.cases.Simple.justReturn:()I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 99481200
          :relative 1.1627540951312
        )
        :calibrates (7754882 5922939)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 89842266
          :relative 1.1834557361702198
        )
        :calibrates (5809706 5967844)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 92404809
          :relative 1.1985603857494112
        )
        :calibrates (7091119 4608297)
      ))
    :"jpamb.cases.Simple.justReturnNothing:()V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 91526450
          :relative 1.1666326069427344
        )
        :calibrates (6419473 6052754)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 95264592
          :relative 1.2048749597098571
        )
        :calibrates (5891826 5995565)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 92126411
          :relative 1.1977034120076202
        )
        :calibrates (4511084 7176123)
      ))
    :"jpamb.cases.Simple.multiError:(Z)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" no
            :ok no
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 93425311
          :relative 1.192859662112094
        )
        :calibrates (5942818 6042095)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" no
            :ok no
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 92542712
          :relative 1.191553524564866
        )
        :calibrates (5815656 6091792)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" no
            :ok no
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 104666593
          :relative 1.1614543310529464
        )
        :calibrates (7061455 7372447)
      ))
    :"jpamb.cases.Simple.nestedBranchDivision:(II)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 95631841
          :relative 1.206275404419265
        )
        :calibrates (5851339 6043460)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 90647468
          :relative 1.1820209649913487
        )
        :calibrates (5829451 6092977)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 102941577
          :relative 1.2389483565449941
        )
        :calibrates (7236698 4639364)
      ))
    :"jpamb.cases.Simple.nestedConstantCoverage:(III)V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 91984765
          :relative 1.1917981974687653
        )
        :calibrates (5865348 5963643)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 95230520
          :relative 1.203048467723176
        )
        :calibrates (5960423 5972798)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 91627889
          :relative 1.3086905908727178
        )
        :calibrates (4534776 4467806)
      ))
    :"jpamb.cases.Simple.selectedDivisor:(ZII)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 96016599
          :relative 1.2008756259188191
        )
        :calibrates (6093612 5998459)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 88667756
          :relative 1.1643720548911378
        )
        :calibrates (5818194 6327537)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 115665913
          :relative 1.2871561370690972
        )
        :calibrates (4456255 7485805)
      ))
    :"jpamb.cases.Simple.subtractForDivisor:(II)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 89351185
          :relative 1.1526961980647443
        )
        :calibrates (6518539 6054322)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 92148683
          :relative 1.1899029772395542
        )
        :calibrates (5865192 6036704)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 106948889
          :relative 1.1644226050523754
        )
        :calibrates (7278463 7369717)
      ))
    :"jpamb.cases.Strings.checkComplexSequence:(Ljava/lang/String;)V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 89736201
          :relative 1.1758068806416173
        )
        :calibrates (5881048 6091616)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 91750843
          :relative 1.1856347356687986
        )
        :calibrates (5854220 6113332)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 101078100
          :relative 1.142741190935369
        )
        :calibrates (7418413 7134364)
      ))
    :"jpamb.cases.Strings.checkExtension:(Ljava/lang/String;)V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 91336745
          :relative 1.1898491709446732
        )
        :calibrates (5824607 5973881)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 90201791
          :relative 1.1569210039993107
        )
        :calibrates (6536670 6033008)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 105164104
          :relative 1.1355973599638365
        )
        :calibrates (7596713 7795468)
      ))
    :"jpamb.cases.Strings.sayHello2:(Ljava/lang/String;)V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 90000022
          :relative 1.1501950970660424
        )
        :calibrates (6799450 5937854)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 92044599
          :relative 1.18438237694732
        )
        :calibrates (6025111 6015428)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 94786387
          :relative 1.2209611820826383
        )
        :calibrates (6839989 4557647)
      ))
    :"jpamb.cases.Strings.sayHello3:(Ljava/lang/String;)V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 92174919
          :relative 1.1919693810018865
        )
        :calibrates (5813358 6035415)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 89340243
          :relative 1.1757140194399853
        )
        :calibrates (5824204 6098180)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 101712807
          :relative 1.231526886707445
        )
        :calibrates (4671718 7264830)
      ))
    :"jpamb.cases.Strings.sayHello:(Ljava/lang/String;)V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 93560718
          :relative 1.193446587029948
        )
        :calibrates (5948140 6037934)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 91920760
          :relative 1.1892571817535582
        )
        :calibrates (5961922 5928203)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 103358249
          :relative 1.1481415986331738
        )
        :calibrates (7356736 7340428)
      ))
    :"jpamb.cases.Tricky.collatz:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 90916126
          :relative 1.188269844704909
        )
        :calibrates (5825602 5961338)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 91810588
          :relative 1.1851091233087623
        )
        :calibrates (5987548 6002299)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 100525251
          :relative 1.1449418554270587
        )
        :calibrates (6999124 7400903)
      ))
    :"jpamb.cases.advanced.CWE470.strict_safe_dispatcher:(Ljava/lang/String;)V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 90371854
          :relative 1.1721845101884345
        )
        :calibrates (5860828 6297635)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 91287821
          :relative 1.1900490222384625
        )
        :calibrates (5822912 5963831)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 102686994
          :relative 1.16001921275575
        )
        :calibrates (7024647 7183133)
      ))
    :"jpamb.cases.advanced.CWE470.unsafe_dispatcher:(Ljava/lang/String;)V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 89502096
          :relative 1.224378857164151
        )
        :calibrates (6323713 4354150)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 90727494
          :relative 1.1880268388348292
        )
        :calibrates (5819552 5949516)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 98012000
          :relative 1.1354240563567128
        )
        :calibrates (7110910 7240190)
      ))
    :"jpamb.cases.advanced.CWE470.weak_dispatcher:(Ljava/lang/String;)V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 113481939
          :relative 1.345745351137949
        )
        :calibrates (4240863 5997049)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 91374817
          :relative 1.1890169519018194
        )
        :calibrates (5809376 6016670)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 106113663
          :relative 1.25678779365157
        )
        :calibrates (7038240 4711101)
      ))
    :"jpamb.cases.advanced.CWE502.blacklist_deserialization:(Ljava/lang/String;)V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 87609650
          :relative 1.083613601674854
        )
        :calibrates (8530317 5923027)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 93349112
          :relative 1.2000581647725792
        )
        :calibrates (5877421 5900863)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 88996177
          :relative 1.1774547101204025
        )
        :calibrates (4591032 7237930)
      ))
    :"jpamb.cases.advanced.CWE502.insecure_deserialization:(Ljava/lang/String;)V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 88465381
          :relative 1.17601649097208
        )
        :calibrates (5859048 5938367)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 96892423
          :relative 1.214277214401037
        )
        :calibrates (5891139 5940437)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 86804857
          :relative 1.1926553048729238
        )
        :calibrates (6815216 4325644)
      ))
    :"jpamb.cases.advanced.CWE502.whitelist_deserialization:(Ljava/lang/String;)V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 91111215
          :relative 1.1757369085414542
        )
        :calibrates (6167521 5990557)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 92562864
          :relative 1.1909437894777426
        )
        :calibrates (5820822 6105952)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 88279814
          :relative 1.31364365269051
        )
        :calibrates (4293172 4282097)
      ))
  )
)