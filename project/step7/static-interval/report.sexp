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
      :"jpamb.cases.Guards.assertAfterGuard:(I)I" ()
      :"jpamb.cases.Guards.assertDerivedRange:(II)V" ()
      :"jpamb.cases.Guards.assertWrongDerivation:(I)V" ()
      :"jpamb.cases.Guards.boundedLoopCheck:(I)I" ()
      :"jpamb.cases.Guards.clampThenDivide:(I)I" ()
      :"jpamb.cases.Guards.classifyThenIndex:(I)I" ()
      :"jpamb.cases.Guards.constantMode:(I)I" ()
      :"jpamb.cases.Guards.divGuardNotZero:(I)I" ()
      :"jpamb.cases.Guards.divGuardPositiveReversed:(I)I" ()
      :"jpamb.cases.Guards.divGuardWrongBound:(I)I" ()
      :"jpamb.cases.Guards.mergeLosesZero:(I)I" ()
      :"jpamb.cases.Guards.rangeCheckLowerMissing:(I)I" ()
      :"jpamb.cases.Guards.rangeCheckOffByOne:(I)I" ()
      :"jpamb.cases.Guards.rangeCheckedRead:(I)I" ()
      :"jpamb.cases.Guards.signThenDivide:(I)I" ()
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
          :absolute 102438089
          :relative 1.201721929963135
        )
        :calibrates (6640200 6235461)
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
          :absolute 94052334
          :relative 1.2032292137653346
        )
        :calibrates (5801952 5978728)
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
          :absolute 113647187
          :relative 1.0697963407477291
        )
        :calibrates (9078654 10276309)
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
          :absolute 93576118
          :relative 1.185055938884404
        )
        :calibrates (5919804 6302106)
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
          :absolute 93337442
          :relative 1.1978941432039623
        )
        :calibrates (5879982 5955658)
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
          :absolute 112158990
          :relative 1.1105100389925124
        )
        :calibrates (9813849 7578332)
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
          :absolute 89469990
          :relative 1.1524177773225448
        )
        :calibrates (6335230 6262422)
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
          :absolute 92239795
          :relative 1.191402707998045
        )
        :calibrates (5889923 5982671)
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
          :absolute 131898746
          :relative 1.221351366968338
        )
        :calibrates (5141468 10704519)
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
          :absolute 104654249
          :relative 1.22583418781449
        )
        :calibrates (6244978 6198812)
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
          :absolute 94874643
          :relative 1.1984098216572558
        )
        :calibrates (5873304 6142984)
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
          :absolute 133592333
          :relative 1.2172656601148606
        )
        :calibrates (10674221 5526930)
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
          :absolute 96923820
          :relative 1.2089352260761073
        )
        :calibrates (5917240 6064649)
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
          :absolute 94752701
          :relative 1.2001985244855151
        )
        :calibrates (5936413 6015105)
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
          :absolute 131069846
          :relative 1.14680471352077
        )
        :calibrates (9246026 9449086)
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
          :absolute 91826569
          :relative 1.1832809049602262
        )
        :calibrates (5907986 6134536)
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
          :absolute 93032891
          :relative 1.1664316109552222
        )
        :calibrates (6575831 6107546)
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
          :absolute 144877118
          :relative 1.2163915441633677
        )
        :calibrates (9523622 8081468)
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
          :absolute 93916487
          :relative 1.203387373246946
        )
        :calibrates (5839466 5919915)
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
          :absolute 98688710
          :relative 1.2071832894012025
        )
        :calibrates (6299262 5950120)
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
          :absolute 151466302
          :relative 1.238193281133035
        )
        :calibrates (8254209 9250413)
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
          :absolute 93653446
          :relative 1.1937454773109808
        )
        :calibrates (5903143 6086556)
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
          :absolute 117884749
          :relative 1.2773333720042386
        )
        :calibrates (5926726 6522841)
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
          :absolute 141648291
          :relative 1.1883450514497151
        )
        :calibrates (9246025 9114973)
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
          :absolute 95690667
          :relative 1.206208373958705
        )
        :calibrates (5884358 6019595)
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
          :absolute 118337204
          :relative 1.3018663214074462
        )
        :calibrates (5846813 5964141)
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
          :absolute 147172127
          :relative 1.2415894167276702
        )
        :calibrates (9221817 7654052)
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
          :absolute 110144848
          :relative 1.2704103276000445
        )
        :calibrates (5856034 5963051)
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
          :absolute 90295112
          :relative 1.337642098106574
        )
        :calibrates (3807001 4492503)
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
          :absolute 113957267
          :relative 1.2820531274414415
        )
        :calibrates (5554875 6349837)
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
          :absolute 114929608
          :relative 1.3095085649554814
        )
        :calibrates (5936268 5334496)
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
          :absolute 88024541
          :relative 1.3013364476311582
        )
        :calibrates (4477493 4318752)
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
          :absolute 130450378
          :relative 1.1496369700259874
        )
        :calibrates (9235754 9250051)
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
          :absolute 87887271
          :relative 1.307553090969547
        )
        :calibrates (4229223 4428484)
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
          :absolute 87177206
          :relative 1.1336202977584673
        )
        :calibrates (4245984 8571791)
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
          :absolute 160846862
          :relative 1.3469339610050697
        )
        :calibrates (8902287 5569049)
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
          :absolute 86307173
          :relative 1.19391942431584
        )
        :calibrates (4310265 6734525)
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
          :absolute 88116424
          :relative 1.2086661390792113
        )
        :calibrates (6615584 4284271)
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
          :absolute 132710755
          :relative 1.1384667994909248
        )
        :calibrates (9754375 9541715)
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
          :absolute 93361568
          :relative 1.2834824986282227
        )
        :calibrates (5299115 4421990)
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
          :absolute 89749649
          :relative 1.3233673988520676
        )
        :calibrates (4228478 4296541)
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
          :absolute 139716048
          :relative 1.3268682906644258
        )
        :calibrates (5850292 7314318)
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
          :absolute 117165911
          :relative 1.3836292820989267
        )
        :calibrates (4287680 5399603)
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
          :absolute 98668126
          :relative 1.3609834802522365
        )
        :calibrates (4269488 4325067)
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
          :absolute 142815557
          :relative 1.31699068169824
        )
        :calibrates (5231289 8534935)
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
          :absolute 90123228
          :relative 1.3025699409045066
        )
        :calibrates (4249202 4731221)
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
          :absolute 95940761
          :relative 1.2709868125778239
        )
        :calibrates (4267494 6013766)
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
          :absolute 165146288
          :relative 1.2888900029129289
        )
        :calibrates (8392838 8589943)
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
          :absolute 89195173
          :relative 1.3167160234264916
        )
        :calibrates (4293302 4309805)
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
          :absolute 90928465
          :relative 1.1751439979849088
        )
        :calibrates (5881633 6268635)
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
          :absolute 145096037
          :relative 1.4061822601918197
        )
        :calibrates (5981919 5407545)
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
          :absolute 89372205
          :relative 1.3173681017903063
        )
        :calibrates (4302721 4304528)
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
          :absolute 101199167
          :relative 1.236807893828331
        )
        :calibrates (5847494 5885235)
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
          :absolute 110604657
          :relative 1.3075191358563794
        )
        :calibrates (5607485 5288946)
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
          :absolute 85779395
          :relative 1.2280483507929032
        )
        :calibrates (4247817 5899813)
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
          :absolute 88876127
          :relative 1.15740399063234
        )
        :calibrates (5833466 6537714)
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
          :absolute 108904882
          :relative 1.2178896134885275
        )
        :calibrates (5213248 7975019)
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
          :absolute 98948012
          :relative 1.2230821018085385
        )
        :calibrates (5928618 5911471)
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
          :absolute 94529112
          :relative 1.2005656828265663
        )
        :calibrates (5855806 6057434)
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
          :absolute 105944615
          :relative 1.3147153222589334
        )
        :calibrates (5075203 5190615)
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
          :absolute 95428313
          :relative 1.2057426985779018
        )
        :calibrates (5909525 5974527)
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
          :absolute 86775840
          :relative 1.158448731112491
        )
        :calibrates (5875430 6174377)
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
          :absolute 133850466
          :relative 1.3972482495279612
        )
        :calibrates (5461401 5263706)
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
          :absolute 89779700
          :relative 1.1520783807969521
        )
        :calibrates (5816339 6834804)
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
          :absolute 96880717
          :relative 1.1676533384237313
        )
        :calibrates (5818465 7352391)
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
          :absolute 130533613
          :relative 1.3951818295692058
        )
        :calibrates (5312856 5196365)
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
          :absolute 96827133
          :relative 1.1754635774276587
        )
        :calibrates (6474116 6454841)
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
          :absolute 86061037
          :relative 1.1635062568014165
        )
        :calibrates (5861791 5950396)
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
          :absolute 142975170
          :relative 1.275002481296044
        )
        :calibrates (5338112 9842460)
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
          :absolute 85035498
          :relative 1.1275498774560313
        )
        :calibrates (6627286 6051579)
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
          :absolute 89220722
          :relative 1.1788615717727666
        )
        :calibrates (5826105 5994349)
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
          :absolute 179005780
          :relative 1.3632641400001884
        )
        :calibrates (9520021 5990733)
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
          :absolute 95433279
          :relative 1.2053163642654645
        )
        :calibrates (5890227 6006116)
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
          :absolute 92411849
          :relative 1.1788512895285546
        )
        :calibrates (5907767 6335755)
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
          :absolute 113228324
          :relative 1.3069135503266365
        )
        :calibrates (5760500 5409972)
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
          :absolute 94405650
          :relative 1.1814323133492382
        )
        :calibrates (6534226 5899339)
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
          :absolute 98415931
          :relative 1.217980979443748
        )
        :calibrates (5943478 5972081)
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
          :absolute 122930614
          :relative 1.211837250349393
        )
        :calibrates (5494269 9601415)
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
          :absolute 93452028
          :relative 1.1934495511752357
        )
        :calibrates (5903406 6068662)
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
          :absolute 94127730
          :relative 1.1884126695363049
        )
        :calibrates (5858972 6340328)
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
          :absolute 113994853
          :relative 1.1825165652204532
        )
        :calibrates (9472333 5503765)
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
          :absolute 98069386
          :relative 1.2121730054081572
        )
        :calibrates (5897668 6135790)
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
          :absolute 97277821
          :relative 1.2037021168383712
        )
        :calibrates (5882395 6289038)
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
          :absolute 126505987
          :relative 1.1861622852213325
        )
        :calibrates (5205480 11275339)
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
          :absolute 96669753
          :relative 1.2052303484236102
        )
        :calibrates (5932694 6120170)
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
          :absolute 93424818
          :relative 1.1999145087461818
        )
        :calibrates (5843378 5948358)
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
          :absolute 187624927
          :relative 1.2395338086222683
        )
        :calibrates (11294820 10321747)
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
          :absolute 91843821
          :relative 1.1882688318791415
        )
        :calibrates (5969888 5937352)
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
          :absolute 92746900
          :relative 1.1917336604089757
        )
        :calibrates (5962010 5966762)
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
          :absolute 128060723
          :relative 1.1138303208627898
        )
        :calibrates (10103345 9603433)
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
          :absolute 94322549
          :relative 1.1984121804026513
        )
        :calibrates (5924610 6021688)
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
          :absolute 92181798
          :relative 1.1890905734035182
        )
        :calibrates (5884830 6043636)
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
          :absolute 134678207
          :relative 1.263828235272556
        )
        :calibrates (9155688 5516642)
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
          :absolute 94618375
          :relative 1.2589785774461977
        )
        :calibrates (6071982 4351838)
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
          :absolute 93692304
          :relative 1.1919530352400878
        )
        :calibrates (5891421 6152860)
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
          :absolute 167706385
          :relative 1.312932891912366
        )
        :calibrates (9800661 6516579)
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
          :absolute 91988946
          :relative 1.3322163354245584
        )
        :calibrates (4277465 4284024)
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
          :absolute 97762789
          :relative 1.2066490693469722
        )
        :calibrates (5807693 6341698)
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
          :absolute 122875239
          :relative 1.3541481386696321
        )
        :calibrates (5446572 5426349)
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
          :absolute 94801277
          :relative 1.3627130286733407
        )
        :calibrates (4312006 3912904)
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
          :absolute 85431553
          :relative 1.1350585718754505
        )
        :calibrates (6606735 5912844)
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
          :absolute 167082939
          :relative 1.3398405948142007
        )
        :calibrates (5697183 9582752)
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
          :absolute 100119373
          :relative 1.4152058103626923
        )
        :calibrates (3828379 3868990)
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
          :absolute 98474727
          :relative 1.2121564639066986
        )
        :calibrates (5817922 6265733)
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
          :absolute 157279719
          :relative 1.1982776685239924
        )
        :calibrates (10063324 9862902)
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
          :absolute 81045613
          :relative 1.3232148650957338
        )
        :calibrates (3786402 3914554)
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
          :absolute 90391037
          :relative 1.2170800744239485
        )
        :calibrates (6614636 4352047)
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
          :absolute 144592874
          :relative 1.2642656210896472
        )
        :calibrates (10428114 5308499)
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
          :absolute 122552814
          :relative 1.4002338509967713
        )
        :calibrates (3799390 5953188)
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
          :absolute 88812976
          :relative 1.3159994411329996
        )
        :calibrates (4270449 4309940)
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
          :absolute 168725155
          :relative 1.309885564442641
        )
        :calibrates (8220409 8311548)
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
          :absolute 97128600
          :relative 1.2167979407972798
        )
        :calibrates (5820731 5971044)
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
          :absolute 97778292
          :relative 1.3570509674049334
        )
        :calibrates (4216742 4377775)
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
          :absolute 176481438
          :relative 1.3652996820450538
        )
        :calibrates (9065142 6155373)
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
          :absolute 101104367
          :relative 1.230899835645678
        )
        :calibrates (5891746 5990542)
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
          :absolute 91952186
          :relative 1.2406953406323837
        )
        :calibrates (6173422 4392240)
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
          :absolute 162248070
          :relative 1.3091687664071217
        )
        :calibrates (5828437 10095145)
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
          :absolute 90949003
          :relative 1.188903169078805
        )
        :calibrates (5810339 5963681)
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
          :absolute 118561635
          :relative 1.4358220817249467
        )
        :calibrates (4377837 4314811)
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
          :absolute 144197740
          :relative 1.1407573896297563
        )
        :calibrates (10556208 10299794)
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
          :absolute 104423322
          :relative 1.3117386924817505
        )
        :calibrates (5849617 4338380)
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
          :absolute 90283496
          :relative 1.2961445635864433
        )
        :calibrates (4579860 4550624)
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
          :absolute 121951183
          :relative 1.0506973434376823
        )
        :calibrates (10602668 11100277)
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
          :absolute 89960248
          :relative 1.3214470931231959
        )
        :calibrates (4241217 4341673)
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
          :absolute 91448157
          :relative 1.2528721656763957
        )
        :calibrates (4241043 5976178)
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
          :absolute 183282764
          :relative 1.2573319832936491
        )
        :calibrates (10379952 9888456)
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
          :absolute 106228655
          :relative 1.315923598071848
        )
        :calibrates (4311763 5952980)
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
          :absolute 102695131
          :relative 1.2445151982124512
        )
        :calibrates (5801857 5894878)
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
          :absolute 130212296
          :relative 1.1216562363078357
        )
        :calibrates (10467592 9212438)
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
          :absolute 88022626
          :relative 1.30593437476508
        )
        :calibrates (4404228 4299192)
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
          :absolute 93109952
          :relative 1.184446633823324
        )
        :calibrates (5903162 6274936)
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
          :absolute 125191628
          :relative 1.092131188031966
        )
        :calibrates (10252026 10000262)
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
          :absolute 88543548
          :relative 1.30597972891052
        )
        :calibrates (4282003 4472010)
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
          :absolute 111483791
          :relative 1.2215207328910616
        )
        :calibrates (5859389 7528774)
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
          :absolute 167334958
          :relative 1.26135653408543
        )
        :calibrates (9105808 9228315)
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
          :absolute 92701257
          :relative 1.255304368156933
        )
        :calibrates (4313020 5986364)
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
          :absolute 126418201
          :relative 1.3767920949719596
        )
        :calibrates (4356415 6261702)
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
          :absolute 160714166
          :relative 1.454190114028483
        )
        :calibrates (5716858 5578345)
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
          :absolute 94914227
          :relative 1.2050942747182432
        )
        :calibrates (5837865 5999827)
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
          :absolute 124376170
          :relative 1.3020953170454785
        )
        :calibrates (5857879 6549266)
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
          :absolute 157641000
          :relative 1.3743434265252978
        )
        :calibrates (7957208 5358239)
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
          :absolute 93236091
          :relative 1.1982482606670153
        )
        :calibrates (5834911 5978241)
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
          :absolute 113949850
          :relative 1.2312636863586304
        )
        :calibrates (6523311 6857427)
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
          :absolute 112228910
          :relative 1.3047932648889817
        )
        :calibrates (5669770 5456292)
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
          :absolute 93954757
          :relative 1.1943366635979848
        )
        :calibrates (5875070 6136841)
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
          :absolute 130615218
          :relative 1.242828987807818
        )
        :calibrates (6723708 8210933)
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
          :absolute 117950428
          :relative 1.3351237997879828
        )
        :calibrates (5464385 5440114)
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
          :absolute 95196204
          :relative 1.2080306679971804
        )
        :calibrates (5893231 5899624)
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
          :absolute 124007701
          :relative 1.1761994927057735
        )
        :calibrates (7974668 8555572)
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
          :absolute 149615791
          :relative 1.4460199954735715
        )
        :calibrates (5330296 5384587)
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
          :absolute 89003754
          :relative 1.1763332353560079
        )
        :calibrates (5969192 5891365)
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
          :absolute 130784251
          :relative 1.3114061791488183
        )
        :calibrates (7945343 4824315)
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
          :absolute 121840685
          :relative 1.204205612642678
        )
        :calibrates (9478392 5748691)
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
          :absolute 92749753
          :relative 1.3354726769426293
        )
        :calibrates (4245917 4321898)
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
          :absolute 147822970
          :relative 1.433583073408042
        )
        :calibrates (4421928 6472109)
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
          :absolute 130991336
          :relative 1.2238649111952418
        )
        :calibrates (5999201 9646955)
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
          :absolute 87697741
          :relative 1.318066790603599
        )
        :calibrates (4242348 4190060)
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
          :absolute 124384929
          :relative 1.2539275029410648
        )
        :calibrates (5913518 7949898)
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
          :absolute 179874782
          :relative 1.3007946335300473
        )
        :calibrates (7262673 10734556)
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
          :absolute 91486736
          :relative 1.3294765362748318
        )
        :calibrates (4254235 4314399)
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
          :absolute 158814328
          :relative 1.2887352991616927
        )
        :calibrates (7910316 8427138)
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
          :absolute 175240739
          :relative 1.2251318433600402
        )
        :calibrates (9587642 11282876)
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
          :absolute 95176816
          :relative 1.3458024041126915
        )
        :calibrates (4270598 4314767)
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
          :absolute 150110928
          :relative 1.2714907533824986
        )
        :calibrates (8960564 7107056)
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
          :absolute 140884727
          :relative 1.0964545885881904
        )
        :calibrates (11320653 11244554)
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
          :absolute 94863909
          :relative 1.1911700641320753
        )
        :calibrates (6293620 5923278)
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
          :absolute 109505110
          :relative 1.2198234687690424
        )
        :calibrates (7026114 6175922)
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
          :absolute 176023907
          :relative 1.2748795509090476
        )
        :calibrates (9007170 9687685)
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
          :absolute 91396057
          :relative 1.187543984301871
        )
        :calibrates (5864271 6004711)
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
          :absolute 102024403
          :relative 1.351931501859318
        )
        :calibrates (4665320 4408759)
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
          :absolute 156596862
          :relative 1.3033429761686834
        )
        :calibrates (10050174 5526333)
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
          :absolute 94452705
          :relative 1.202964409192942
        )
        :calibrates (5860604 5977441)
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
          :absolute 129640114
          :relative 1.330539446374551
        )
        :calibrates (4313571 7798822)
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
          :absolute 137847709
          :relative 1.2236375781833904
        )
        :calibrates (5440740 11032991)
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
          :absolute 93244081
          :relative 1.1813303052090873
        )
        :calibrates (5819824 6463643)
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
          :absolute 143067397
          :relative 1.3336037691006077
        )
        :calibrates (8592552 4680381)
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
          :absolute 135329492
          :relative 1.2227041125134268
        )
        :calibrates (10809099 5398487)
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
          :absolute 92042492
          :relative 1.1911524153681508
        )
        :calibrates (5874915 5979113)
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
          :absolute 107578771
          :relative 1.230045605448855
        )
        :calibrates (4637950 8030135)
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
          :absolute 117493198
          :relative 1.2256515317786938
        )
        :calibrates (8267011 5709256)
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
          :absolute 91358601
          :relative 1.2563098192434292
        )
        :calibrates (5816764 4309975)
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
          :absolute 168597787
          :relative 1.419460649496396
        )
        :calibrates (8364108 4471641)
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
          :absolute 145374844
          :relative 1.0910934393880642
        )
        :calibrates (12272386 11301209)
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
          :absolute 86813092
          :relative 1.3069936380279645
        )
        :calibrates (4237956 4324958)
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
          :absolute 121336515
          :relative 1.433248266441735
        )
        :calibrates (4640522 4308452)
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
          :absolute 156763634
          :relative 1.272428111953893
        )
        :calibrates (11370337 5373200)
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
          :absolute 84412853
          :relative 1.2903183994921346
        )
        :calibrates (4262035 4390038)
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
          :absolute 156650068
          :relative 1.500704926184047
        )
        :calibrates (4467824 5423528)
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
          :absolute 113000769
          :relative 1.2248354392452478
        )
        :calibrates (5331405 8135753)
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
          :absolute 88057413
          :relative 1.2357694324549706
        )
        :calibrates (4230919 6002635)
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
          :absolute 183562696
          :relative 1.4038816223613038
        )
        :calibrates (9881764 4603713)
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
          :absolute 105487619
          :relative 1.0775555055303037
        )
        :calibrates (8385930 9261277)
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
          :absolute 93360539
          :relative 1.1970611288894133
        )
        :calibrates (5811354 6049944)
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
          :absolute 182304980
          :relative 1.0253628121922849
        )
        :calibrates (5533312 28859344)
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
          :absolute 110853712
          :relative 1.1037727614453567
        )
        :calibrates (8925566 8532956)
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
          :absolute 93350152
          :relative 1.1998548710961585
        )
        :calibrates (5814440 5969490)
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
          :absolute 180670419
          :relative 0.9747913499221849
        )
        :calibrates (33146770 5146786)
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
          :absolute 131139045
          :relative 1.124829524627107
        )
        :calibrates (8611485 11064319)
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
          :absolute 97594871
          :relative 1.2220240961221882
        )
        :calibrates (5820248 5886409)
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
          :absolute 187996515
          :relative 1.3768626894965281
        )
        :calibrates (5043893 10743743)
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
          :absolute 175360130
          :relative 1.260077224099721
        )
        :calibrates (10458310 8811775)
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
          :absolute 91253004
          :relative 1.1870024687036125
        )
        :calibrates (5914197 5950993)
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
          :absolute 158646042
          :relative 1.3119640949010425
        )
        :calibrates (6424584 9045588)
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
          :absolute 149485767
          :relative 1.249926072159559
        )
        :calibrates (8830751 7984516)
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
          :absolute 89426118
          :relative 1.154620290561805
        )
        :calibrates (6030503 6497276)
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
          :absolute 121831198
          :relative 1.214261820940884
        )
        :calibrates (9318492 5558896)
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
          :absolute 115157681
          :relative 1.2040040268056749
        )
        :calibrates (6519722 7878832)
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
          :absolute 90606450
          :relative 1.1846095367184768
        )
        :calibrates (5880530 5965684)
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
          :absolute 120240650
          :relative 1.2045165816766703
        )
        :calibrates (5713274 9303088)
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
          :absolute 121809914
          :relative 1.1362230995820082
        )
        :calibrates (7905091 9897759)
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
          :absolute 98930051
          :relative 1.2468093763348724
        )
        :calibrates (5971033 5237502)
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
          :absolute 163336248
          :relative 1.2640491535421192
        )
        :calibrates (9719211 8066180)
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
          :absolute 165918402
          :relative 1.274162126309922
        )
        :calibrates (9685030 7965690)
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
          :absolute 86720863
          :relative 1.306049233976476
        )
        :calibrates (4275396 4297042)
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
          :absolute 120513400
          :relative 1.3078791148351487
        )
        :calibrates (6277909 5584864)
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
          :absolute 157509891
          :relative 1.2881621417250462
        )
        :calibrates (8237563 7987100)
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
          :absolute 95748617
          :relative 1.2612365099178786
        )
        :calibrates (4279220 6214416)
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
          :absolute 125692448
          :relative 1.3363390889572753
        )
        :calibrates (5907606 5680170)
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
          :absolute 150757185
          :relative 1.1663550609233724
        )
        :calibrates (11953131 8603548)
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
          :absolute 109589448
          :relative 1.2643614343670357
        )
        :calibrates (5840376 6084045)
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
          :absolute 121098756
          :relative 1.3475901220641107
        )
        :calibrates (5561742 5317022)
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
          :absolute 166481203
          :relative 1.2528801087727786
        )
        :calibrates (9211915 9388177)
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
          :absolute 93845212
          :relative 1.1950128857126203
        )
        :calibrates (5811728 6167511)
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
          :absolute 116967311
          :relative 1.2017305491183978
        )
        :calibrates (5336052 9365526)
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
          :absolute 125067513
          :relative 1.1536344417975615
        )
        :calibrates (6978553 10582076)
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
          :absolute 116053677
          :relative 1.2965844945173486
        )
        :calibrates (5829247 5895525)
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
          :absolute 161653750
          :relative 1.2176568582143372
        )
        :calibrates (9694490 9892104)
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
          :absolute 118751961
          :relative 1.076247325043228
        )
        :calibrates (10934717 8991436)
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
          :absolute 94480060
          :relative 1.2026486538937555
        )
        :calibrates (5934145 5915941)
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
          :absolute 176801905
          :relative 1.2752000521370646
        )
        :calibrates (8929510 9834121)
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
          :absolute 143263218
          :relative 1.235207579158733
        )
        :calibrates (8941516 7729310)
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
          :absolute 93536309
          :relative 1.19855014496618
        )
        :calibrates (5844852 5998103)
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
          :absolute 182892878
          :relative 1.2748332109068417
        )
        :calibrates (10511548 8914908)
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
          :absolute 167297612
          :relative 1.2676907389209235
        )
        :calibrates (8230409 9834218)
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
          :absolute 96833744
          :relative 1.194174559929072
        )
        :calibrates (5847525 6537080)
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
          :absolute 147444389
          :relative 1.1679902192689857
        )
        :calibrates (10469592 9559812)
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
          :absolute 138429726
          :relative 1.1317843702657886
        )
        :calibrates (9825778 10613944)
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
          :absolute 123814828
          :relative 1.2950372739043694
        )
        :calibrates (6354949 6198567)
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
          :absolute 119783435
          :relative 1.1645942978374597
        )
        :calibrates (10810247 5589323)
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
          :absolute 153075939
          :relative 1.2916398707899919
        )
        :calibrates (8739488 6902684)
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
          :absolute 106585673
          :relative 1.2899537695624497
        )
        :calibrates (6396419 4537480)
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
          :absolute 128279076
          :relative 1.1391014994772048
        )
        :calibrates (9173440 9451047)
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
          :absolute 125888299
          :relative 1.2785681064554757
        )
        :calibrates (7303479 5953582)
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
          :absolute 101467253
          :relative 1.3630393265380985
        )
        :calibrates (4302556 4494079)
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
          :absolute 158755170
          :relative 1.2175177291188028
        )
        :calibrates (9781134 9460420)
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
          :absolute 115682126
          :relative 1.3679916684718987
        )
        :calibrates (4858253 5057018)
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
          :absolute 112082097
          :relative 1.40498998436214
        )
        :calibrates (4515820 4306367)
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
          :absolute 163375663
          :relative 1.2059295945015946
        )
        :calibrates (9574707 10762334)
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
          :absolute 156200440
          :relative 1.2828814717091954
        )
        :calibrates (9293186 6993427)
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
          :absolute 97556291
          :relative 1.2327181357199493
        )
        :calibrates (4303185 7114213)
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
          :absolute 128824630
          :relative 1.1837479053319946
        )
        :calibrates (10447280 6429166)
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
          :absolute 141632813
          :relative 1.4406189504490907
        )
        :calibrates (5252142 5017964)
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
          :absolute 103773809
          :relative 1.1894511988371792
        )
        :calibrates (7291336 6126008)
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
          :absolute 163057065
          :relative 1.4354715778097629
        )
        :calibrates (5362446 6602150)
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
          :absolute 166941826
          :relative 1.2663070689397184
        )
        :calibrates (8521360 9562373)
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
          :absolute 115586317
          :relative 1.290715173687059
        )
        :calibrates (5926176 5910268)
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
          :absolute 136408259
          :relative 1.174309219900731
        )
        :calibrates (9094404 9168147)
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
          :absolute 233778074
          :relative 1.351436012927408
        )
        :calibrates (9638688 11177335)
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
          :absolute 95243652
          :relative 1.1319829679999027
        )
        :calibrates (5843081 8213609)
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
          :absolute 192990996
          :relative 1.2563963600578845
        )
        :calibrates (10213504 11174521)
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
          :absolute 219205656
          :relative 1.1850572633606724
        )
        :calibrates (14021095 14609112)
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
          :absolute 146425854
          :relative 1.1869502078768785
        )
        :calibrates (7996324 11045018)
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
          :absolute 186163280
          :relative 1.2528738998079667
        )
        :calibrates (11124364 9675003)
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
          :absolute 208206812
          :relative 1.2498963550152888
        )
        :calibrates (11288417 12133831)
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
          :absolute 131491201
          :relative 1.1082601180818938
        )
        :calibrates (12071129 8424751)
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
          :absolute 179426685
          :relative 1.2450459376096106
        )
        :calibrates (9700771 10710549)
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
          :absolute 165195862
          :relative 1.19668391756903
        )
        :calibrates (11278232 9727859)
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
          :absolute 127894441
          :relative 1.1060721363208281
        )
        :calibrates (10004723 10031208)
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
          :absolute 173068762
          :relative 1.323829220030161
        )
        :calibrates (10674742 5747009)
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
          :absolute 159281852
          :relative 1.2425425529044312
        )
        :calibrates (9936603 8287818)
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
          :absolute 99526551
          :relative 1.3633340847565822
        )
        :calibrates (4281467 4341066)
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
          :absolute 167218825
          :relative 1.2959873468795888
        )
        :calibrates (6787380 10129794)
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
          :absolute 122762464
          :relative 1.253030325873087
        )
        :calibrates (8478907 5231971)
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
          :absolute 116163211
          :relative 1.3587113803347932
        )
        :calibrates (4246847 5924705)
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
          :absolute 160749895
          :relative 1.3167690925799995
        )
        :calibrates (10067030 5435822)
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
          :absolute 112498685
          :relative 1.2048400611671966
        )
        :calibrates (8435315 5603724)
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
          :absolute 90711297
          :relative 1.2520662319280411
        )
        :calibrates (5864390 4289329)
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
          :absolute 122815451
          :relative 1.1955375337022205
        )
        :calibrates (10010953 5647378)
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
          :absolute 152735951
          :relative 1.3320589982554571
        )
        :calibrates (9009575 5210840)
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
          :absolute 86126492
          :relative 1.304711527818439
        )
        :calibrates (4237671 4302277)
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
          :absolute 132140001
          :relative 1.1977464193825582
        )
        :calibrates (5765387 10996306)
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
          :absolute 165542190
          :relative 1.3871337224066793
        )
        :calibrates (5311041 8265995)
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
          :absolute 89398785
          :relative 1.243672333950795
        )
        :calibrates (4243875 5958218)
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
          :absolute 147751848
          :relative 1.2512104783228182
        )
        :calibrates (10953467 5617675)
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
          :absolute 162765592
          :relative 1.27860217782672
        )
        :calibrates (8699270 8439925)
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
          :absolute 102259232
          :relative 1.241604892262263
        )
        :calibrates (5845360 5880039)
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
          :absolute 170597789
          :relative 1.2910604520163191
        )
        :calibrates (8593978 8861950)
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
          :absolute 133197781
          :relative 1.1342531972839072
        )
        :calibrates (8085054 11470665)
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
          :absolute 115143617
          :relative 1.2901486920137344
        )
        :calibrates (5841469 5965031)
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
          :absolute 180802335
          :relative 1.2468224012958091
        )
        :calibrates (9581882 10901970)
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
          :absolute 162630968
          :relative 1.2874373262766945
        )
        :calibrates (8671665 8108488)
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
          :absolute 96321989
          :relative 1.2113369455944714
        )
        :calibrates (5908733 5933088)
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
          :absolute 167377978
          :relative 1.222229630712828
        )
        :calibrates (10172150 9895600)
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
          :absolute 174398657
          :relative 1.2982749773831552
        )
        :calibrates (8151812 9399038)
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
          :absolute 90123465
          :relative 1.1819744875829843
        )
        :calibrates (5947388 5907389)
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
          :absolute 155236035
          :relative 1.2744281909705542
        )
        :calibrates (10989397 5514798)
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
          :absolute 132372841
          :relative 1.1196078514610432
        )
        :calibrates (10669466 9431690)
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
          :absolute 95044130
          :relative 1.192717048525759
        )
        :calibrates (5837876 6358709)
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
          :absolute 166740207
          :relative 1.4770843670868485
        )
        :calibrates (5751279 5365679)
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
          :absolute 133169143
          :relative 1.1320533870973293
        )
        :calibrates (9705848 9944951)
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
          :absolute 99749123
          :relative 1.2087859151912426
        )
        :calibrates (6280574 6054824)
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
          :absolute 109676063
          :relative 1.1526995401318305
        )
        :calibrates (9922957 5509757)
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
          :absolute 166450345
          :relative 1.2649025374360918
        )
        :calibrates (9625162 8463738)
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
          :absolute 100162162
          :relative 1.2314088362166482
        )
        :calibrates (5833055 5924712)
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
          :absolute 118758144
          :relative 1.0943734220854908
        )
        :calibrates (9943677 9168932)
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
          :absolute 117070497
          :relative 1.237651286129051
        )
        :calibrates (5228798 8317673)
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
          :absolute 95323167
          :relative 1.2075159766517671
        )
        :calibrates (5895257 5927329)
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
          :absolute 196725198
          :relative 1.2927463040327847
        )
        :calibrates (9956425 10094928)
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
          :absolute 120902705
          :relative 1.1406322799352289
        )
        :calibrates (9148182 8343587)
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
          :absolute 89148085
          :relative 1.1755993592254441
        )
        :calibrates (5954122 5945760)
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
          :absolute 184001073
          :relative 1.269197707468575
        )
        :calibrates (10632868 9166560)
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
          :absolute 163057848
          :relative 1.212468278161524
        )
        :calibrates (8497373 11496799)
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
          :absolute 99147785
          :relative 1.1990430094078564
        )
        :calibrates (5866937 6672268)
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
          :absolute 119404787
          :relative 1.29681232890584
        )
        :calibrates (5974457 6082547)
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
          :absolute 119417939
          :relative 1.1419768214209776
        )
        :calibrates (8781651 8441902)
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
          :absolute 88432873
          :relative 1.1562598420089087
        )
        :calibrates (6371564 5970389)
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
          :absolute 124183975
          :relative 1.3270589728679423
        )
        :calibrates (5587314 6108665)
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
          :absolute 111661981
          :relative 1.0995148604606035
        )
        :calibrates (8884337 8874743)
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
          :absolute 117462377
          :relative 1.2897169680393297
        )
        :calibrates (6030835 6025403)
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
          :absolute 140259374
          :relative 1.1707582848593263
        )
        :calibrates (9753370 9178940)
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
          :absolute 125453121
          :relative 1.1485424281115657
        )
        :calibrates (9279722 8542795)
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
          :absolute 103166289
          :relative 1.2253064200118382
        )
        :calibrates (5833727 6448055)
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
          :absolute 201871330
          :relative 1.3028898067531656
        )
        :calibrates (9963492 10137377)
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
          :absolute 107834686
          :relative 1.0740275740834342
        )
        :calibrates (9283943 8903050)
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
          :absolute 106510305
          :relative 1.2250276667502968
        )
        :calibrates (6363999 6324024)
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
          :absolute 154655457
          :relative 1.2243692862987956
        )
        :calibrates (10096812 8354445)
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
          :absolute 165604952
          :relative 1.2716630036976477
        )
        :calibrates (8851143 8867902)
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
          :absolute 99978386
          :relative 1.2315453691425324
        )
        :calibrates (5797322 5935183)
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
          :absolute 170728623
          :relative 1.245841292129724
        )
        :calibrates (8941549 10444756)
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
          :absolute 162013364
          :relative 1.339186034369349
        )
        :calibrates (9490779 5347885)
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
          :absolute 102237851
          :relative 1.237651897117089
        )
        :calibrates (5821781 6008357)
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
          :absolute 153363417
          :relative 1.1391893687483097
        )
        :calibrates (13048013 9213896)
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
          :absolute 137984759
          :relative 1.3099710661289021
        )
        :calibrates (5441295 8076008)
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
          :absolute 110492898
          :relative 1.3082916217628051
        )
        :calibrates (5813885 5052191)
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
          :absolute 130686447
          :relative 1.1789319426461313
        )
        :calibrates (10627349 6683908)
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
          :absolute 171162527
          :relative 1.2990152645428954
        )
        :calibrates (8178983 9016858)
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
          :absolute 86760717
          :relative 1.2321849096852968
        )
        :calibrates (4211743 5954681)
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
          :absolute 185977363
          :relative 1.4867832977532176
        )
        :calibrates (5955557 6170142)
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
          :absolute 159723156
          :relative 1.2726285652880172
        )
        :calibrates (10148116 6903648)
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
          :absolute 89671960
          :relative 1.2383628298830172
        )
        :calibrates (6057395 4301748)
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
          :absolute 141022821
          :relative 1.221013505423046
        )
        :calibrates (6043306 10912010)
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
          :absolute 106322184
          :relative 1.0674041385145454
        )
        :calibrates (8819763 9387713)
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
          :absolute 86269080
          :relative 1.209558472806009
        )
        :calibrates (4251190 6398248)
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
          :absolute 126813008
          :relative 1.1379312612824923
        )
        :calibrates (12554805 5906506)
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
          :absolute 119490841
          :relative 1.146327039729856
        )
        :calibrates (9351461 7710839)
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
          :absolute 91661292
          :relative 1.1932573556635713
        )
        :calibrates (5843072 5904784)
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
          :absolute 161260658
          :relative 1.366693618753867
        )
        :calibrates (7833682 6029560)
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
          :absolute 140631140
          :relative 1.3015034866125401
        )
        :calibrates (5233917 8813873)
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
          :absolute 88383542
          :relative 1.170640766139174
        )
        :calibrates (5968014 5965288)
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
          :absolute 165922209
          :relative 1.2608993771262962
        )
        :calibrates (7426993 10771488)
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
          :absolute 110342469
          :relative 1.3309736711005193
        )
        :calibrates (5061815 5237279)
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
          :absolute 94555472
          :relative 1.1946894924650688
        )
        :calibrates (5891427 6187467)
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
          :absolute 154536778
          :relative 1.1977923500602532
        )
        :calibrates (10625428 8975178)
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
          :absolute 161109793
          :relative 1.2453548531166418
        )
        :calibrates (8854621 9459964)
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
          :absolute 87271700
          :relative 1.2353369782904267
        )
        :calibrates (5847801 4304546)
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
          :absolute 150008226
          :relative 1.233143461710274
        )
        :calibrates (9229131 8309739)
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
          :absolute 128251994
          :relative 1.1667351950540819
        )
        :calibrates (8885225 8587431)
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
          :absolute 88653618
          :relative 1.2923511161089627
        )
        :calibrates (4240226 4804082)
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
          :absolute 115242853
          :relative 1.2227632111691655
        )
        :calibrates (8533354 5266700)
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
          :absolute 162614338
          :relative 1.3652713765933435
        )
        :calibrates (5992894 8032577)
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
          :absolute 101732227
          :relative 1.2959480935017205
        )
        :calibrates (4296271 5996693)
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
          :absolute 163204445
          :relative 1.2568647565082767
        )
        :calibrates (8727480 9339985)
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
          :absolute 174762022
          :relative 1.2600039762153128
        )
        :calibrates (8231602 10975997)
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
          :absolute 92877951
          :relative 1.19622694371634
        )
        :calibrates (5904302 5918371)
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
          :absolute 152976174
          :relative 1.221081909154395
        )
        :calibrates (9884778 8504805)
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
          :absolute 149786080
          :relative 1.1505843122551576
        )
        :calibrates (11384099 9795471)
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
          :absolute 94354026
          :relative 1.2003760048970473
        )
        :calibrates (5887196 6009173)
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
          :absolute 164802382
          :relative 1.2899568028729351
        )
        :calibrates (8484764 8421073)
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
          :absolute 162151847
          :relative 1.171249292005886
        )
        :calibrates (9748013 12114627)
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
          :absolute 127211980
          :relative 1.3246642452502144
        )
        :calibrates (5871119 6176293)
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
          :absolute 170641490
          :relative 1.2928377250806604
        )
        :calibrates (8552752 8836340)
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
          :absolute 140989464
          :relative 1.3165261214449882
        )
        :calibrates (8343634 5261115)
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
          :absolute 116276150
          :relative 1.2781935029038463
        )
        :calibrates (5951806 6303584)
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
          :absolute 172013221
          :relative 1.400742144821485
        )
        :calibrates (5729274 7943281)
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
          :absolute 125379306
          :relative 1.102609399098878
        )
        :calibrates (10087225 9711921)
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
          :absolute 97166379
          :relative 1.196621756301821
        )
        :calibrates (6356453 6000866)
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
          :absolute 161994468
          :relative 1.482555556176739
        )
        :calibrates (5379291 5286047)
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
          :absolute 118542319
          :relative 1.2171797748773205
        )
        :calibrates (5951511 8427322)
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
          :absolute 98678062
          :relative 1.2203830266235423
        )
        :calibrates (5844854 6036545)
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
          :absolute 163976197
          :relative 1.3412685386980645
        )
        :calibrates (5171217 9775378)
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
          :absolute 157069229
          :relative 1.224165931104689
        )
        :calibrates (9197740 9550270)
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
          :absolute 97423326
          :relative 1.2156416194574766
        )
        :calibrates (5921390 5937699)
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
          :absolute 131707414
          :relative 1.1220117455587768
        )
        :calibrates (10728358 9161353)
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
          :absolute 123414398
          :relative 1.1130254381327571
        )
        :calibrates (9698047 9328956)
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
          :absolute 96161330
          :relative 1.1944681144791713
        )
        :calibrates (6326993 5963303)
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
          :absolute 142038507
          :relative 1.2385468331223346
        )
        :calibrates (7903734 8497981)
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
          :absolute 173733698
          :relative 1.3725910065276732
        )
        :calibrates (9357705 5376376)
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
          :absolute 100175378
          :relative 1.2324720922389847
        )
        :calibrates (5803843 5926721)
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
          :absolute 135477580
          :relative 1.1920511121115727
        )
        :calibrates (8822768 8589138)
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
          :absolute 155134628
          :relative 1.2156623463657938
        )
        :calibrates (9631567 9251668)
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
          :absolute 93476606
          :relative 1.198665960949432
        )
        :calibrates (5831511 6000729)
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
          :absolute 131709284
          :relative 1.2092089185984098
        )
        :calibrates (8590127 7681743)
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
          :absolute 111133197
          :relative 1.1615270544550385
        )
        :calibrates (10027959 5295145)
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
          :absolute 91274446
          :relative 1.1887821539743746
        )
        :calibrates (5845896 5973548)
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
          :absolute 157156061
          :relative 1.2341560676086003
        )
        :calibrates (8123564 10208234)
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
          :absolute 151362123
          :relative 1.331936495850806
        )
        :calibrates (5162828 8933653)
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
          :absolute 104706966
          :relative 1.2373429871080763
        )
        :calibrates (6145829 5978636)
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
          :absolute 140743846
          :relative 1.1589340116428224
        )
        :calibrates (10271518 9250531)
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
          :absolute 169586899
          :relative 1.2727086416471294
        )
        :calibrates (9406661 8694801)
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
          :absolute 90421518
          :relative 1.1872793728385451
        )
        :calibrates (5834171 5915411)
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
          :absolute 134865959
          :relative 1.3848042379515983
        )
        :calibrates (5573917 5546680)
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
          :absolute 158771252
          :relative 1.2567595016083115
        )
        :calibrates (8786001 8794950)
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
          :absolute 88017203
          :relative 1.1535552309684964
        )
        :calibrates (5929587 6431092)
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
          :absolute 114286578
          :relative 1.208346074759835
        )
        :calibrates (5646551 8500931)
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
          :absolute 133904392
          :relative 1.1318853735366061
        )
        :calibrates (9656095 10110845)
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
          :absolute 91560916
          :relative 1.1875936285033717
        )
        :calibrates (5857851 6031181)
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
          :absolute 158595966
          :relative 1.4788992051962784
        )
        :calibrates (5288578 5241290)
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
          :absolute 153692207
          :relative 1.1784753615900203
        )
        :calibrates (10032345 10347763)
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
          :absolute 96732364
          :relative 1.1934380333475192
        )
        :calibrates (5916092 6476546)
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
          :absolute 147083683
          :relative 1.2896029052939229
        )
        :calibrates (5243561 9856948)
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
          :absolute 173665209
          :relative 1.1530463715389943
        )
        :calibrates (10722856 13694377)
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
          :absolute 87090568
          :relative 1.0861406053841303
        )
        :calibrates (6358855 7925496)
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
          :absolute 135540987
          :relative 1.0949128540701654
        )
        :calibrates (12497404 9289112)
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
          :absolute 116500535
          :relative 1.1440614115125198
        )
        :calibrates (8818228 7904091)
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
          :absolute 112369448
          :relative 1.1778339198507637
        )
        :calibrates (8187041 6735553)
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
          :absolute 151958358
          :relative 1.1941269841912063
        )
        :calibrates (9270381 10166546)
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
          :absolute 146186392
          :relative 1.3364635111229584
        )
        :calibrates (8062398 5410885)
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
          :absolute 118472707
          :relative 1.2766144407568794
        )
        :calibrates (6479963 6052426)
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
          :absolute 117711351
          :relative 1.0996483212633197
        )
        :calibrates (9494360 9221079)
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
          :absolute 167829457
          :relative 1.4909597777189552
        )
        :calibrates (5465862 5371870)
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
          :absolute 105682198
          :relative 1.2442350162015765
        )
        :calibrates (6176714 5868009)
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
          :absolute 147269104
          :relative 1.3083912543035572
        )
        :calibrates (9131542 5347852)
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
          :absolute 165741739
          :relative 1.3800024611798667
        )
        :calibrates (5268032 8550421)
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
          :absolute 93211070
          :relative 1.1904376137034884
        )
        :calibrates (6036900 5987402)
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
          :absolute 138714665
          :relative 1.1757243222263218
        )
        :calibrates (9464866 9046056)
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
          :absolute 146987540
          :relative 1.2337029675443434
        )
        :calibrates (8577287 8586280)
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
          :absolute 89545808
          :relative 1.1778750649526306
        )
        :calibrates (5820637 6069865)
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
          :absolute 153912651
          :relative 1.2379647126290392
        )
        :calibrates (8793003 9003702)
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
          :absolute 123533974
          :relative 1.2935817174916977
        )
        :calibrates (7087755 5479334)
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
          :absolute 100306414
          :relative 1.2314587189182835
        )
        :calibrates (5838120 5935228)
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
          :absolute 107696415
          :relative 1.0545978205004787
        )
        :calibrates (9305952 9688791)
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
          :absolute 162927494
          :relative 1.4842037575452773
        )
        :calibrates (5438852 5247282)
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
          :absolute 93861717
          :relative 1.267539387282043
        )
        :calibrates (5827751 4310875)
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
          :absolute 167094430
          :relative 1.2523624752056641
        )
        :calibrates (8638170 10052699)
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
          :absolute 158788593
          :relative 1.4874402014342634
        )
        :calibrates (5075977 5261370)
      ))
    :"jpamb.cases.Guards.assertAfterGuard:(I)I" ((analysis-result
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
          :absolute 90591746
          :relative 1.3198405315082413
        )
        :calibrates (4283037 4392135)
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
          :absolute 161656440
          :relative 1.1952592032160363
        )
        :calibrates (10601840 10021728)
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
          :absolute 140207166
          :relative 1.3609033221905498
        )
        :calibrates (5619443 6595653)
      ))
    :"jpamb.cases.Guards.assertDerivedRange:(II)V" ((analysis-result
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
          :absolute 88432135
          :relative 1.3112592356272212
        )
        :calibrates (4318013 4319344)
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
          :absolute 148090449
          :relative 1.1979986127198063
        )
        :calibrates (10057552 8716518)
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
          :absolute 166965846
          :relative 1.2188408871937293
        )
        :calibrates (10167047 10008102)
      ))
    :"jpamb.cases.Guards.assertWrongDerivation:(I)V" ((analysis-result
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
          :absolute 87318529
          :relative 1.3058878958296298
        )
        :calibrates (4312983 4321742)
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
          :absolute 111492749
          :relative 1.112186730150529
        )
        :calibrates (9218348 8003902)
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
          :absolute 115707735
          :relative 1.083954184376834
        )
        :calibrates (10019914 9053929)
      ))
    :"jpamb.cases.Guards.boundedLoopCheck:(I)I" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 85885503
          :relative 1.301766987819918
        )
        :calibrates (4268751 4305237)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 130181656
          :relative 1.1903228309997242
        )
        :calibrates (9210979 7586997)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 161936078
          :relative 1.2850356629797361
        )
        :calibrates (8559651 8241458)
      ))
    :"jpamb.cases.Guards.clampThenDivide:(I)I" ((analysis-result
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
          :absolute 85439937
          :relative 1.2231797662013562
        )
        :calibrates (4290784 5930634)
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
          :absolute 173563578
          :relative 1.2495586299134578
        )
        :calibrates (11008499 8531744)
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
          :absolute 144110903
          :relative 1.2621361223005578
        )
        :calibrates (5998723 9762529)
      ))
    :"jpamb.cases.Guards.classifyThenIndex:(I)I" ((analysis-result
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
          :absolute 93360871
          :relative 1.194829089231056
        )
        :calibrates (5916428 6006030)
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
          :absolute 153300011
          :relative 1.2573937420959982
        )
        :calibrates (8717333 8233008)
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
          :absolute 135127544
          :relative 1.1950726292706517
        )
        :calibrates (10792706 6453805)
      ))
    :"jpamb.cases.Guards.constantMode:(I)I" ((analysis-result
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
          :absolute 99527117
          :relative 1.2140149163502671
        )
        :calibrates (6079932 6080710)
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
          :absolute 204695974
          :relative 1.378203764959971
        )
        :calibrates (9945785 7191244)
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
          :absolute 172643860
          :relative 1.3493474736641542
        )
        :calibrates (6329289 9117338)
      ))
    :"jpamb.cases.Guards.divGuardNotZero:(I)I" ((analysis-result
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
          :absolute 95685986
          :relative 1.2066378206381938
        )
        :calibrates (5989411 5902195)
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
          :absolute 174629340
          :relative 1.0115685937827474
        )
        :calibrates (7187217 26820589)
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
          :absolute 148882584
          :relative 1.1440288295420125
        )
        :calibrates (9145017 12226978)
      ))
    :"jpamb.cases.Guards.divGuardPositiveReversed:(I)I" ((analysis-result
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
          :absolute 90924285
          :relative 1.1608743213197388
        )
        :calibrates (6537980 6017565)
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
          :absolute 198923115
          :relative 1.2027901186837229
        )
        :calibrates (13845178 11096469)
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
          :absolute 112599399
          :relative 1.1896482467312428
        )
        :calibrates (9248666 5303171)
      ))
    :"jpamb.cases.Guards.divGuardWrongBound:(I)I" ((analysis-result
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
          :absolute 98802705
          :relative 1.2213070987523458
        )
        :calibrates (5902695 5968426)
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
          :absolute 118638407
          :relative 1.1009472085143308
        )
        :calibrates (10681900 8124605)
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
          :absolute 113899737
          :relative 1.3422857410987916
        )
        :calibrates (5236968 5120819)
      ))
    :"jpamb.cases.Guards.mergeLosesZero:(I)I" ((analysis-result
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
          :absolute 87369956
          :relative 1.1682066980377033
        )
        :calibrates (5921380 5941371)
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
          :absolute 116861566
          :relative 1.1949581409516852
        )
        :calibrates (5320457 9598675)
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
          :absolute 155664412
          :relative 1.2795717833473423
        )
        :calibrates (5574992 10779895)
      ))
    :"jpamb.cases.Guards.rangeCheckLowerMissing:(I)I" ((analysis-result
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
          :absolute 93790003
          :relative 1.201829210290075
        )
        :calibrates (5805587 5980166)
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
          :absolute 114609707
          :relative 1.1766830331245561
        )
        :calibrates (10006388 5254098)
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
          :absolute 170967161
          :relative 1.2672040221712364
        )
        :calibrates (8912318 9569244)
      ))
    :"jpamb.cases.Guards.rangeCheckOffByOne:(I)I" ((analysis-result
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
          :absolute 93836446
          :relative 1.1984880583980486
        )
        :calibrates (5893335 5989320)
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
          :absolute 120943339
          :relative 1.124086971347576
        )
        :calibrates (5221202 12955914)
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
          :absolute 138874995
          :relative 1.1973663669333041
        )
        :calibrates (9052973 8578463)
      ))
    :"jpamb.cases.Guards.rangeCheckedRead:(I)I" ((analysis-result
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
          :absolute 92822352
          :relative 1.1919992758065419
        )
        :calibrates (5829167 6102010)
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
          :absolute 178086052
          :relative 1.2046274361758795
        )
        :calibrates (11872171 10362590)
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
          :absolute 158116054
          :relative 1.2685081087301715
        )
        :calibrates (9314834 7726275)
      ))
    :"jpamb.cases.Guards.signThenDivide:(I)I" ((analysis-result
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
          :absolute 94191666
          :relative 1.2030073866121338
        )
        :calibrates (5818164 5985996)
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
          :absolute 118657370
          :relative 1.069602138241791
        )
        :calibrates (10062885 10154388)
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
          :absolute 125998953
          :relative 1.1779141524487293
        )
        :calibrates (8065310 8664183)
      ))
  )
)