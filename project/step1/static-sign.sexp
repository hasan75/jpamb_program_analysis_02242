(analysis-summary
  :config (analysis-config
    :cmd (solutions/static/.venv/bin/static-sign)
    :analysis (analysis-info
      :name static-sign
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
          :absolute 95694435
          :relative 1.2745246298660575
        )
        :calibrates (4147853 6023812)
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
          :absolute 87385701
          :relative 1.3037936668553258
        )
        :calibrates (4327366 4355772)
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
          :absolute 89533429
          :relative 1.2322239931060062
        )
        :calibrates (6124877 4365503)
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
          :absolute 91782915
          :relative 1.3435266627022344
        )
        :calibrates (4385681 3937037)
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
          :absolute 86720104
          :relative 1.3002893630780665
        )
        :calibrates (4328964 4357848)
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
          :absolute 93721006
          :relative 1.2447602377223939
        )
        :calibrates (4379852 6288730)
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
          :absolute 88621429
          :relative 1.333725616517512
        )
        :calibrates (3804495 4414962)
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
          :absolute 88404088
          :relative 1.3044014434545042
        )
        :calibrates (4396328 4375718)
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
          :absolute 88438394
          :relative 1.2325051801590756
        )
        :calibrates (5947250 4408121)
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
          :absolute 94671474
          :relative 1.2560014372283064
        )
        :calibrates (4346161 6155251)
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
          :absolute 91821161
          :relative 1.319947883550932
        )
        :calibrates (4347864 4442865)
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
          :absolute 103409780
          :relative 1.3778031454005188
        )
        :calibrates (4292024 4373373)
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
          :absolute 101557433
          :relative 1.1902469599978225
        )
        :calibrates (6777035 6329707)
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
          :absolute 88850476
          :relative 1.311371863005731
        )
        :calibrates (4302416 4373551)
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
          :absolute 87136989
          :relative 1.3003928496872177
        )
        :calibrates (4332931 4393561)
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
          :absolute 92265152
          :relative 1.153466850983986
        )
        :calibrates (6895005 6064871)
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
          :absolute 92135199
          :relative 1.3236471436394446
        )
        :calibrates (4353677 4392302)
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
          :absolute 88899171
          :relative 1.300480269709836
        )
        :calibrates (4366782 4534395)
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
          :absolute 92135197
          :relative 1.2368802453350094
        )
        :calibrates (5883927 4796173)
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
          :absolute 90810558
          :relative 1.3186956276753987
        )
        :calibrates (4365139 4353942)
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
          :absolute 88202530
          :relative 1.3061630245354339
        )
        :calibrates (4321355 4395263)
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
          :absolute 92090882
          :relative 1.1499332688380302
        )
        :calibrates (4481002 8560072)
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
          :absolute 87339145
          :relative 1.3031211627619614
        )
        :calibrates (4291668 4400293)
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
          :absolute 93370316
          :relative 1.318746278682128
        )
        :calibrates (4550170 4413638)
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
          :absolute 96842171
          :relative 1.3270931026816342
        )
        :calibrates (4786701 4333437)
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
          :absolute 92703214
          :relative 1.3249955683656625
        )
        :calibrates (4332195 4440423)
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
          :absolute 88557428
          :relative 1.3096410115071841
        )
        :calibrates (4312231 4369653)
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
          :absolute 87974276
          :relative 1.305279644979852
        )
        :calibrates (4273850 4437913)
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
          :absolute 94793812
          :relative 1.3367006833118809
        )
        :calibrates (4375165 4356746)
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
          :absolute 87942267
          :relative 1.18675467054753
        )
        :calibrates (5088495 6352742)
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
          :absolute 96823865
          :relative 1.3827099928736417
        )
        :calibrates (3823394 4198971)
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
          :absolute 94029847
          :relative 1.289900250280438
        )
        :calibrates (4468465 5178606)
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
          :absolute 89888271
          :relative 1.1397870069553135
        )
        :calibrates (6280881 6749167)
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
          :absolute 93031165
          :relative 1.3488681745153588
        )
        :calibrates (3924358 4408429)
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
          :absolute 90017613
          :relative 1.2941020272021952
        )
        :calibrates (4407828 4738683)
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
          :absolute 87744750
          :relative 1.1294005892952586
        )
        :calibrates (6567122 6460062)
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
          :absolute 103075037
          :relative 1.3867134507763563
        )
        :calibrates (4081077 4380865)
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
          :absolute 88031206
          :relative 1.3047987351994343
        )
        :calibrates (4343806 4383253)
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
          :absolute 90884035
          :relative 1.233607130330972
        )
        :calibrates (6068960 4545807)
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
          :absolute 93946070
          :relative 1.2360302853326122
        )
        :calibrates (4370399 6540947)
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
          :absolute 89408202
          :relative 1.315870895044908
        )
        :calibrates (4272843 4367609)
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
          :absolute 88543053
          :relative 1.2849601929723458
        )
        :calibrates (4374760 4813310)
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
          :absolute 87400226
          :relative 1.151508190042362
        )
        :calibrates (6433124 5898900)
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
          :absolute 97463892
          :relative 1.2998137636608567
        )
        :calibrates (5449560 4324162)
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
          :absolute 88234546
          :relative 1.2106795737362532
        )
        :calibrates (4358636 6505347)
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
          :absolute 92116242
          :relative 1.2109707761915203
        )
        :calibrates (6931096 4403223)
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
          :absolute 97452808
          :relative 1.3737930074776021
        )
        :calibrates (3885356 4356620)
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
          :absolute 94233428
          :relative 1.2296192894001223
        )
        :calibrates (5951372 5156112)
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
          :absolute 97528871
          :relative 1.3476999892696089
        )
        :calibrates (4345456 4413719)
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
          :absolute 88719339
          :relative 1.3092747282335682
        )
        :calibrates (4336667 4368429)
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
          :absolute 89806331
          :relative 1.3143449227500623
        )
        :calibrates (4313602 4395874)
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
          :absolute 85302173
          :relative 1.2817473618541695
        )
        :calibrates (4493441 4424051)
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
          :absolute 89147541
          :relative 1.3336418367014076
        )
        :calibrates (4302471 3967377)
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
          :absolute 104463810
          :relative 1.2844873925898725
        )
        :calibrates (4354596 6497371)
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
          :absolute 90050119
          :relative 1.314908013727052
        )
        :calibrates (4321139 4400664)
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
          :absolute 88345830
          :relative 1.3242883324769674
        )
        :calibrates (3963837 4410062)
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
          :absolute 89456361
          :relative 1.2320066447870486
        )
        :calibrates (6081619 4404978)
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
          :absolute 84926226
          :relative 1.2109251930897456
        )
        :calibrates (4506477 5944253)
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
          :absolute 98473442
          :relative 1.354498576149676
        )
        :calibrates (4312062 4394577)
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
          :absolute 89756590
          :relative 1.3086249485423675
        )
        :calibrates (4398822 4421235)
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
          :absolute 90472631
          :relative 1.2382974573707548
        )
        :calibrates (5952887 4500325)
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
          :absolute 92558570
          :relative 1.3248571625853673
        )
        :calibrates (4402107 4359615)
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
          :absolute 86067675
          :relative 1.280300549291413
        )
        :calibrates (4301076 4726466)
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
          :absolute 88796597
          :relative 1.3002372556904715
        )
        :calibrates (4495326 4400557)
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
          :absolute 85761636
          :relative 1.2614092574302371
        )
        :calibrates (4783138 4612230)
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
          :absolute 94782239
          :relative 1.3243090666748305
        )
        :calibrates (4311116 4672432)
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
          :absolute 83765464
          :relative 1.271873658178902
        )
        :calibrates (4347252 4610960)
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
          :absolute 86292607
          :relative 1.2869529291410777
        )
        :calibrates (4317819 4595730)
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
          :absolute 96113098
          :relative 1.345382166260382
        )
        :calibrates (4308831 4369384)
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
          :absolute 85427536
          :relative 1.2119617408908594
        )
        :calibrates (4374289 6113070)
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
          :absolute 89982720
          :relative 1.3156141040994496
        )
        :calibrates (4308173 4392944)
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
          :absolute 89617731
          :relative 1.3132240771312567
        )
        :calibrates (4331418 4382227)
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
          :absolute 86535124
          :relative 1.154867022582887
        )
        :calibrates (6033191 6082701)
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
          :absolute 89632459
          :relative 1.311916300416155
        )
        :calibrates (4306612 4434748)
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
          :absolute 91391993
          :relative 1.2423404897401842
        )
        :calibrates (4323400 6138189)
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
          :absolute 93066242
          :relative 1.22660136851047
        )
        :calibrates (6649433 4396968)
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
          :absolute 90406859
          :relative 1.3175529117611804
        )
        :calibrates (4309106 4394084)
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
          :absolute 91194289
          :relative 1.224882814900153
        )
        :calibrates (6393343 4473786)
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
          :absolute 89497525
          :relative 1.3067144515535436
        )
        :calibrates (4368495 4464878)
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
          :absolute 86389116
          :relative 1.2970001830520554
        )
        :calibrates (4353249 4366196)
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
          :absolute 88788674
          :relative 1.3059129349033847
        )
        :calibrates (4384819 4394779)
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
          :absolute 92028973
          :relative 1.321967902863452
        )
        :calibrates (4344883 4424856)
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
          :absolute 87741570
          :relative 1.301821579757847
        )
        :calibrates (4349391 4408788)
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
          :absolute 88323565
          :relative 1.3084517400211864
        )
        :calibrates (4322092 4360609)
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
          :absolute 87240313
          :relative 1.299707740741631
        )
        :calibrates (4380130 4370503)
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
          :absolute 86597467
          :relative 1.2862864582745854
        )
        :calibrates (4374465 4584312)
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
          :absolute 87057223
          :relative 1.2995668247221137
        )
        :calibrates (4359252 4375850)
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
          :absolute 88387364
          :relative 1.307025531426399
        )
        :calibrates (4327822 4389732)
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
          :absolute 91555357
          :relative 1.3220637162401534
        )
        :calibrates (4320865 4401817)
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
          :absolute 106224983
          :relative 1.3870835188795543
        )
        :calibrates (4339758 4373351)
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
          :absolute 90894679
          :relative 1.3156343281184228
        )
        :calibrates (4410461 4378431)
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
          :absolute 86597823
          :relative 1.2672353241961516
        )
        :calibrates (4619449 4741107)
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
          :absolute 86124193
          :relative 1.2972941386285222
        )
        :calibrates (4324703 4362121)
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
          :absolute 90022719
          :relative 1.2950830504521762
        )
        :calibrates (4716676 4409715)
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
          :absolute 88149023
          :relative 1.3082811009434991
        )
        :calibrates (4305285 4363663)
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
          :absolute 92223424
          :relative 1.3267310352424053
        )
        :calibrates (4316439 4375971)
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
          :absolute 84880807
          :relative 1.2754369057778396
        )
        :calibrates (4540529 4462789)
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
          :absolute 87571231
          :relative 1.3044818857340217
        )
        :calibrates (4321175 4366620)
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
          :absolute 90856719
          :relative 1.3192477434866758
        )
        :calibrates (4316945 4395485)
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
          :absolute 84828285
          :relative 1.1937862485781483
        )
        :calibrates (4364219 6494646)
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
          :absolute 86539074
          :relative 1.300611425479854
        )
        :calibrates (4311290 4350962)
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
          :absolute 88494134
          :relative 1.3054923329214152
        )
        :calibrates (4378696 4380256)
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
          :absolute 141006564
          :relative 1.3748923927982402
        )
        :calibrates (6029516 5865826)
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
          :absolute 94854016
          :relative 1.3378302375624695
        )
        :calibrates (4300397 4414364)
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
          :absolute 93941422
          :relative 1.247300098419298
        )
        :calibrates (4324674 6306642)
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
          :absolute 112278383
          :relative 1.1976084821567208
        )
        :calibrates (5373443 8873368)
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
          :absolute 90513747
          :relative 1.28603873861731
        )
        :calibrates (4356232 5013039)
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
          :absolute 91847608
          :relative 1.2384320752590803
        )
        :calibrates (5957305 4651483)
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
          :absolute 139521692
          :relative 1.3164544707157924
        )
        :calibrates (8540598 4924740)
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
          :absolute 92145175
          :relative 1.2489402610237914
        )
        :calibrates (5831894 4556833)
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
          :absolute 86704301
          :relative 1.2976328518663918
        )
        :calibrates (4382979 4355539)
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
          :absolute 90046755
          :relative 1.30534446684005
        )
        :calibrates (4357666 4557996)
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
          :absolute 89983106
          :relative 1.3002864787914894
        )
        :calibrates (4656880 4356849)
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
          :absolute 89584673
          :relative 1.3090859884463755
        )
        :calibrates (4400916 4392907)
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
          :absolute 98337390
          :relative 1.3526479272853675
        )
        :calibrates (4342686 4389053)
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
          :absolute 88763548
          :relative 1.215699006863248
        )
        :calibrates (4684989 6118540)
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
          :absolute 90202548
          :relative 1.3096570831649719
        )
        :calibrates (4379203 4463636)
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
          :absolute 90572676
          :relative 1.3163017983101482
        )
        :calibrates (4321446 4422861)
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
          :absolute 90675557
          :relative 1.2361652349719192
        )
        :calibrates (6051444 4476777)
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
          :absolute 88058773
          :relative 1.304975073947352
        )
        :calibrates (4338910 4387338)
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
          :absolute 90255477
          :relative 1.3136821792905513
        )
        :calibrates (4388273 4378129)
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
          :absolute 85958767
          :relative 1.291570596335316
        )
        :calibrates (4406288 4378870)
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
          :absolute 88694398
          :relative 1.308034537119131
        )
        :calibrates (4338534 4389002)
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
          :absolute 94342810
          :relative 1.3322800513094133
        )
        :calibrates (4309147 4470130)
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
          :absolute 102301199
          :relative 1.3001952858229884
        )
        :calibrates (4323449 5926352)
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
          :absolute 93376279
          :relative 1.250615498235434
        )
        :calibrates (4319088 6167907)
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
          :absolute 96935826
          :relative 1.2551449180277598
        )
        :calibrates (4391567 6382245)
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
          :absolute 96445058
          :relative 1.1689918564849338
        )
        :calibrates (6163654 6907626)
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
          :absolute 91904782
          :relative 1.2344009381441154
        )
        :calibrates (6216750 4497633)
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
          :absolute 96439172
          :relative 1.2090351226671416
        )
        :calibrates (5885490 6033744)
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
          :absolute 97213041
          :relative 1.155731679277393
        )
        :calibrates (7306964 6276885)
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
          :absolute 86929128
          :relative 1.3008234518314712
        )
        :calibrates (4330798 4366250)
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
          :absolute 91256658
          :relative 1.1879901000456619
        )
        :calibrates (6778202 5060510)
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
          :absolute 92949009
          :relative 1.2332317583350423
        )
        :calibrates (6346638 4518694)
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
          :absolute 87794914
          :relative 1.3050569327919783
        )
        :calibrates (4329261 4369200)
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
          :absolute 86764967
          :relative 1.3154168193868319
        )
        :calibrates (4313981 4079799)
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
          :absolute 92431649
          :relative 1.298946258600047
        )
        :calibrates (4611980 4675640)
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
          :absolute 105126651
          :relative 1.3300590384229247
        )
        :calibrates (4346283 5486666)
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
          :absolute 86617990
          :relative 1.3213693348033917
        )
        :calibrates (3889082 4376411)
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
          :absolute 87856963
          :relative 1.303285904912945
        )
        :calibrates (4369448 4370730)
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
          :absolute 94256960
          :relative 1.1691457593401355
        )
        :calibrates (8352401 4417798)
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
          :absolute 88496947
          :relative 1.2286450473965482
        )
        :calibrates (3909675 6545065)
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
          :absolute 90201517
          :relative 1.3111118868543192
        )
        :calibrates (4353092 4460074)
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
          :absolute 92246436
          :relative 1.312584251311012
        )
        :calibrates (4353049 4629412)
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
          :absolute 87223389
          :relative 1.270579655840935
        )
        :calibrates (4548005 4807846)
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
          :absolute 89263752
          :relative 1.2958661996353842
        )
        :calibrates (4637637 4395507)
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
          :absolute 86784379
          :relative 1.2041994731198578
        )
        :calibrates (4323266 6522796)
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
          :absolute 97886599
          :relative 1.1190535324625972
        )
        :calibrates (8183710 6699606)
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
          :absolute 87620651
          :relative 1.2227595214973457
        )
        :calibrates (4345983 6146468)
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
          :absolute 98566463
          :relative 1.2860126807727885
        )
        :calibrates (5844098 4359339)
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
          :absolute 88812827
          :relative 1.2130433992484133
        )
        :calibrates (6085103 4790724)
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
          :absolute 87186174
          :relative 1.156962035856866
        )
        :calibrates (6076960 6071342)
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
          :absolute 99300428
          :relative 1.352542715914924
        )
        :calibrates (4362300 4457087)
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
          :absolute 89814666
          :relative 1.313703267129653
        )
        :calibrates (4331708 4391455)
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
          :absolute 90116815
          :relative 1.2310989760146775
        )
        :calibrates (6197181 4388940)
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
          :absolute 85831095
          :relative 1.2945463136332662
        )
        :calibrates (4335388 4376822)
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
          :absolute 101026015
          :relative 1.2847935218777393
        )
        :calibrates (4483657 6003788)
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
          :absolute 88798389
          :relative 1.3118921665615102
        )
        :calibrates (4302219 4358280)
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
          :absolute 86731067
          :relative 1.2662158278253381
        )
        :calibrates (4339353 5057639)
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
          :absolute 92272753
          :relative 1.1499511144512464
        )
        :calibrates (6369776 6696516)
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
          :absolute 93591115
          :relative 1.33081137572288
        )
        :calibrates (4320234 4418595)
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
          :absolute 91940213
          :relative 1.3181991945563771
        )
        :calibrates (4464955 4372685)
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
          :absolute 89369631
          :relative 1.145153365559649
        )
        :calibrates (6132333 6663442)
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
          :absolute 87508126
          :relative 1.2991066982995454
        )
        :calibrates (4440923 4348729)
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
          :absolute 87321187
          :relative 1.297788474921847
        )
        :calibrates (4327208 4470330)
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
          :absolute 94381466
          :relative 1.252891629453954
        )
        :calibrates (6168380 4376098)
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
          :absolute 91398851
          :relative 1.3230886620227091
        )
        :calibrates (4320737 4366508)
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
          :absolute 88182085
          :relative 1.302854808574528
        )
        :calibrates (4407340 4373894)
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
          :absolute 88753744
          :relative 1.204956594628189
        )
        :calibrates (4375290 6697577)
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
          :absolute 90624184
          :relative 1.3098615791629566
        )
        :calibrates (4521657 4358334)
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
          :absolute 88489950
          :relative 1.295351561878051
        )
        :calibrates (4362064 4603392)
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
          :absolute 103598052
          :relative 1.2364820310942264
        )
        :calibrates (7155902 4863962)
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
          :absolute 94449427
          :relative 1.3181049255587445
        )
        :calibrates (4582787 4498019)
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
          :absolute 87357607
          :relative 1.2933078762413122
        )
        :calibrates (4312101 4580378)
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
          :absolute 90371419
          :relative 1.3142296088565522
        )
        :calibrates (4406299 4360307)
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
          :absolute 91057578
          :relative 1.2820799101448228
        )
        :calibrates (4459172 5052704)
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
          :absolute 87183400
          :relative 1.2874720447653227
        )
        :calibrates (4613197 4381608)
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
          :absolute 85367706
          :relative 1.180215453419338
        )
        :calibrates (4308882 6965900)
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
          :absolute 98058581
          :relative 1.3287616205889876
        )
        :calibrates (4842384 4356899)
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
          :absolute 87588643
          :relative 1.217831836860701
        )
        :calibrates (4338385 6269919)
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
          :absolute 87060691
          :relative 1.2047114270668837
        )
        :calibrates (6161773 4706003)
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
          :absolute 86350290
          :relative 1.2417165551785518
        )
        :calibrates (4341306 5557373)
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
          :absolute 90815084
          :relative 1.2170590840462259
        )
        :calibrates (6649717 4368946)
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
          :absolute 88140980
          :relative 1.1795515225304638
        )
        :calibrates (4554410 7104457)
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
          :absolute 85106467
          :relative 1.2934719577325111
        )
        :calibrates (4309551 4350503)
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
          :absolute 90382292
          :relative 1.3166304305899523
        )
        :calibrates (4348821 4370505)
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
          :absolute 85894627
          :relative 1.1144677645759151
        )
        :calibrates (6090514 7108097)
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
          :absolute 87431110
          :relative 1.2925367903247287
        )
        :calibrates (4539548 4376229)
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
          :absolute 93552053
          :relative 1.3288159512020754
        )
        :calibrates (4397532 4377877)
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
          :absolute 88532131
          :relative 1.1679304172982006
        )
        :calibrates (5882801 6145395)
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
          :absolute 92187663
          :relative 1.3244636581726232
        )
        :calibrates (4315409 4419113)
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
          :absolute 96701240
          :relative 1.34547117692544
        )
        :calibrates (4334705 4394825)
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
          :absolute 92383044
          :relative 1.2545004429050102
        )
        :calibrates (5913147 4369900)
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
          :absolute 89804370
          :relative 1.2196430721904317
        )
        :calibrates (4755121 6076274)
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
          :absolute 87141612
          :relative 1.2989909523442762
        )
        :calibrates (4321166 4434005)
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
          :absolute 86281901
          :relative 1.2144892432882446
        )
        :calibrates (4324362 6206416)
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
          :absolute 94432953
          :relative 1.1229204670096018
        )
        :calibrates (6845796 7385128)
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
          :absolute 86458866
          :relative 1.2956577945840717
        )
        :calibrates (4379950 4373550)
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
          :absolute 91885201
          :relative 1.249225837482436
        )
        :calibrates (5966390 4386217)
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
          :absolute 87513030
          :relative 1.3026478938320718
        )
        :calibrates (4304909 4413853)
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
          :absolute 89898534
          :relative 1.302601848986876
        )
        :calibrates (4534951 4422424)
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
          :absolute 88524082
          :relative 1.3080571175942677
        )
        :calibrates (4306230 4404094)
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
          :absolute 90459479
          :relative 1.201039899014999
        )
        :calibrates (4367215 7020699)
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
          :absolute 86484728
          :relative 1.2886692088966063
        )
        :calibrates (4567046 4331114)
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
          :absolute 85363412
          :relative 1.289779014583616
        )
        :calibrates (4376548 4383828)
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
          :absolute 87541704
          :relative 1.1549449654891355
        )
        :calibrates (5954162 6300463)
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
          :absolute 86643079
          :relative 1.208391152391776
        )
        :calibrates (4348251 6376142)
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
          :absolute 87728811
          :relative 1.2002459410845054
        )
        :calibrates (4792033 6272327)
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
          :absolute 92765002
          :relative 1.2486501881413397
        )
        :calibrates (6093064 4372532)
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
          :absolute 84595164
          :relative 1.2081598953975758
        )
        :calibrates (3934377 6542109)
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
          :absolute 97367028
          :relative 1.2467373879512185
        )
        :calibrates (6695228 4338049)
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
          :absolute 89312148
          :relative 1.3104563287292867
        )
        :calibrates (4319578 4419874)
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
          :absolute 90996943
          :relative 1.3141101615754336
        )
        :calibrates (4352174 4477540)
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
          :absolute 87218243
          :relative 1.2929329264703089
        )
        :calibrates (4342753 4543208)
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
          :absolute 87223927
          :relative 1.2019922026819378
        )
        :calibrates (4334633 6621907)
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
          :absolute 88679399
          :relative 1.3062232189484604
        )
        :calibrates (4313607 4448923)
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
          :absolute 93794149
          :relative 1.334324323162631
        )
        :calibrates (4302092 4385140)
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
          :absolute 89971568
          :relative 1.1789388640232175
        )
        :calibrates (5859272 6058537)
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
          :absolute 89294695
          :relative 1.2993009032112197
        )
        :calibrates (4498777 4466315)
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
          :absolute 89201937
          :relative 1.3134831234638584
        )
        :calibrates (4302167 4365878)
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
          :absolute 88808016
          :relative 1.1737354726335385
        )
        :calibrates (5853050 6052424)
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
          :absolute 90226948
          :relative 1.2840322300089222
        )
        :calibrates (4923140 4459694)
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
          :absolute 89187129
          :relative 1.3124118174404646
        )
        :calibrates (4304715 4383296)
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
          :absolute 91480110
          :relative 1.1690221715132798
        )
        :calibrates (6160394 6237117)
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
          :absolute 87629047
          :relative 1.2102071219214179
        )
        :calibrates (4537914 6263260)
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
          :absolute 85512509
          :relative 1.2944690273411723
        )
        :calibrates (4305895 4375522)
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
          :absolute 91154863
          :relative 1.1605022704985766
        )
        :calibrates (6192002 6406171)
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
          :absolute 88360097
          :relative 1.2266243101098298
        )
        :calibrates (6111213 4376043)
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
          :absolute 88202364
          :relative 1.2130863045769489
        )
        :calibrates (4628762 6171242)
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
          :absolute 85556878
          :relative 1.1267811892397528
        )
        :calibrates (6337385 6441817)
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
          :absolute 91143305
          :relative 1.3177388335866864
        )
        :calibrates (4365990 4404340)
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
          :absolute 89023034
          :relative 1.1215350183151538
        )
        :calibrates (7183907 6274615)
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
          :absolute 87390344
          :relative 1.2121866159529437
        )
        :calibrates (6328090 4394676)
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
          :absolute 92753758
          :relative 1.338477372172608
        )
        :calibrates (4089747 4419363)
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
          :absolute 88812766
          :relative 1.2318699281425283
        )
        :calibrates (6027831 4386598)
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
          :absolute 89694329
          :relative 1.3078885306725296
        )
        :calibrates (4406852 4422045)
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
          :absolute 86601859
          :relative 1.2757516208253281
        )
        :calibrates (4800442 4378774)
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
          :absolute 86212669
          :relative 1.290269496937896
        )
        :calibrates (4427222 4410322)
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
          :absolute 94160441
          :relative 1.3026985117539744
        )
        :calibrates (4977097 4402841)
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
          :absolute 86360645
          :relative 1.2967139567242625
        )
        :calibrates (4327564 4394754)
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
          :absolute 88974048
          :relative 1.2326881164305235
        )
        :calibrates (4302190 6111514)
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
          :absolute 85967820
          :relative 1.2837819718504389
        )
        :calibrates (4563037 4382037)
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
          :absolute 102120291
          :relative 1.277238663149534
        )
        :calibrates (4334679 6452388)
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
          :absolute 87947059
          :relative 1.227420526785367
        )
        :calibrates (6136447 4282667)
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
          :absolute 95886680
          :relative 1.2482040946529578
        )
        :calibrates (4400959 6427937)
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
          :absolute 93695411
          :relative 1.1638226802184906
        )
        :calibrates (6470921 6379745)
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
          :absolute 89992250
          :relative 1.3352318013749656
        )
        :calibrates (4326412 3991289)
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
          :absolute 89986719
          :relative 1.2317429748768964
        )
        :calibrates (6155127 4400048)
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
          :absolute 92754935
          :relative 1.1692066711144096
        )
        :calibrates (6455542 6109396)
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
          :absolute 87759070
          :relative 1.3012677474324934
        )
        :calibrates (3899519 4871585)
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
          :absolute 89992937
          :relative 1.2249827093495307
        )
        :calibrates (4379612 6341892)
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
          :absolute 85241304
          :relative 1.2184996036704483
        )
        :calibrates (5961220 4346924)
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
          :absolute 89133528
          :relative 1.3104841897023343
        )
        :calibrates (4317195 4404219)
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
          :absolute 92742527
          :relative 1.1839000304228533
        )
        :calibrates (5881351 6263967)
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
          :absolute 95113785
          :relative 1.3280384061710824
        )
        :calibrates (4364462 4573429)
      ))
    :"jpamb.cases.MagicConstants.unreachableRange:(I)V" ((analysis-result
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
          :absolute 87564725
          :relative 1.3089122954214796
        )
        :calibrates (4199609 4399370)
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
          :absolute 89796695
          :relative 1.2149154958386816
        )
        :calibrates (6538915 4410095)
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
          :absolute 95364671
          :relative 1.3564264020336978
        )
        :calibrates (4459718 3934710)
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
          :absolute 85801982
          :relative 1.1853140237639137
        )
        :calibrates (4537504 6662374)
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
          :absolute 88234499
          :relative 1.3088525916035865
        )
        :calibrates (4301359 4364584)
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
          :absolute 88400498
          :relative 1.3457884337124502
        )
        :calibrates (3984994 3989374)
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
          :absolute 98367633
          :relative 1.1868837458093608
        )
        :calibrates (6157361 6636407)
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
          :absolute 85333766
          :relative 1.3051997954922976
        )
        :calibrates (4370049 4081788)
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
          :absolute 88829006
          :relative 1.294263298405925
        )
        :calibrates (4332411 4689977)
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
          :absolute 85917170
          :relative 1.157752084557625
        )
        :calibrates (5859404 6090320)
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
          :absolute 86270528
          :relative 1.2297801127278112
        )
        :calibrates (3889730 6275386)
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
          :absolute 88135575
          :relative 1.2802918918138795
        )
        :calibrates (4852431 4392195)
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
          :absolute 86015797
          :relative 1.190247049696353
        )
        :calibrates (4310652 6790324)
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
          :absolute 89303551
          :relative 1.1502696538579962
        )
        :calibrates (6191806 6444760)
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
          :absolute 86835941
          :relative 1.2886702430933896
        )
        :calibrates (5001748 3932526)
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
          :absolute 87521677
          :relative 1.2403081588669116
        )
        :calibrates (3850300 6215249)
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
          :absolute 89783190
          :relative 1.2633560177139045
        )
        :calibrates (5388967 4402979)
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
          :absolute 99746909
          :relative 1.319902514686188
        )
        :calibrates (4651812 4898706)
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
          :absolute 86040684
          :relative 1.1916830243297623
        )
        :calibrates (4659099 6408434)
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
          :absolute 91605974
          :relative 1.2256240054487388
        )
        :calibrates (4362185 6535388)
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
          :absolute 93201762
          :relative 1.2304734858077282
        )
        :calibrates (4358909 6605384)
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
          :absolute 90542084
          :relative 1.3152253906117746
        )
        :calibrates (4304871 4458175)
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
          :absolute 91469231
          :relative 1.2406138460907417
        )
        :calibrates (6126755 4385386)
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
          :absolute 88870507
          :relative 1.2292994991057362
        )
        :calibrates (6018597 4464465)
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
          :absolute 93413544
          :relative 1.3219335212464398
        )
        :calibrates (4403644 4498740)
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
          :absolute 91893788
          :relative 1.325050159734407
        )
        :calibrates (4306799 4388129)
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
          :absolute 89430571
          :relative 1.3132233877492094
        )
        :calibrates (4289484 4405977)
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
          :absolute 88295391
          :relative 1.303307000272854
        )
        :calibrates (4405251 4378116)
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
          :absolute 90791160
          :relative 1.3208513890199778
        )
        :calibrates (4308164 4365891)
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
          :absolute 87589476
          :relative 1.2975053833393964
        )
        :calibrates (4346275 4484047)
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
          :absolute 93946823
          :relative 1.3333444627580595
        )
        :calibrates (4325188 4395839)
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
          :absolute 92349736
          :relative 1.3265272349253565
        )
        :calibrates (4337091 4371310)
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
          :absolute 85111708
          :relative 1.2996612690692575
        )
        :calibrates (4360322 4177715)
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
          :absolute 86379917
          :relative 1.2950311428471415
        )
        :calibrates (4362997 4395138)
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
          :absolute 92387684
          :relative 1.3207863265758095
        )
        :calibrates (4314866 4513041)
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
          :absolute 84784082
          :relative 1.3134757187985573
        )
        :calibrates (4316204 3922684)
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
          :absolute 91301718
          :relative 1.32138808753199
        )
        :calibrates (4331982 4380078)
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
          :absolute 86460452
          :relative 1.2870477385634664
        )
        :calibrates (4538607 4390330)
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
          :absolute 86775216
          :relative 1.311096122730007
        )
        :calibrates (3811742 4666964)
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
          :absolute 96479654
          :relative 1.3455925996925413
        )
        :calibrates (4325613 4381479)
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
          :absolute 87346706
          :relative 1.2718706021670403
        )
        :calibrates (4321654 5019616)
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
          :absolute 86009293
          :relative 1.2963247675943161
        )
        :calibrates (4343427 4351193)
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
          :absolute 85850580
          :relative 1.2923874298875233
        )
        :calibrates (4387301 4370313)
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
          :absolute 88748069
          :relative 1.3401200752183091
        )
        :calibrates (3971473 4139423)
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
          :absolute 89336373
          :relative 1.3169359855877258
        )
        :calibrates (4209583 4402780)
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
          :absolute 87177141
          :relative 1.3234173871366797
        )
        :calibrates (4349522 3930190)
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
          :absolute 86139563
          :relative 1.2978432425649158
        )
        :calibrates (4307717 4369679)
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
          :absolute 87580443
          :relative 1.2237983830274433
        )
        :calibrates (4313015 6149564)
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
          :absolute 96944908
          :relative 1.3674940021161976
        )
        :calibrates (3918900 4399906)
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
          :absolute 93600239
          :relative 1.3275634373845782
        )
        :calibrates (4343309 4461978)
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
          :absolute 92050765
          :relative 1.2295227611283537
        )
        :calibrates (6788143 4064478)
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
          :absolute 89834366
          :relative 1.3134291081284541
        )
        :calibrates (4354484 4376102)
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
          :absolute 86882607
          :relative 1.2986177526823934
        )
        :calibrates (4366037 4370616)
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
          :absolute 89332586
          :relative 1.3520871073818166
        )
        :calibrates (3921809 4020610)
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
          :absolute 88660169
          :relative 1.3070479048420727
        )
        :calibrates (4361225 4382785)
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
          :absolute 86858898
          :relative 1.315091849837979
        )
        :calibrates (4337085 4072072)
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
          :absolute 98831398
          :relative 1.368348099461513
        )
        :calibrates (4115959 4348064)
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
          :absolute 90356318
          :relative 1.316883017133411
        )
        :calibrates (4344173 4367579)
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
          :absolute 86805569
          :relative 1.3226328178073863
        )
        :calibrates (4302953 3956376)
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
          :absolute 85126919
          :relative 1.2882952464232196
        )
        :calibrates (4366417 4399587)
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
          :absolute 87402881
          :relative 1.3011863000524193
        )
        :calibrates (4338860 4398283)
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
          :absolute 87473777
          :relative 1.33391117257746
        )
        :calibrates (3827390 4282159)
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
          :absolute 90066529
          :relative 1.3170673423731627
        )
        :calibrates (4310653 4369474)
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
          :absolute 83961253
          :relative 1.2815068199163528
        )
        :calibrates (4372309 4409866)
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
          :absolute 90467401
          :relative 1.3332783439710556
        )
        :calibrates (4153954 4245359)
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
          :absolute 85755965
          :relative 1.2969015328119495
        )
        :calibrates (4306454 4351052)
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
          :absolute 92307313
          :relative 1.2300882636253896
        )
        :calibrates (4371910 6496796)
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
          :absolute 89779788
          :relative 1.3202449343470901
        )
        :calibrates (4234338 4355078)
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
          :absolute 91371689
          :relative 1.2429845991412953
        )
        :calibrates (4299790 6143974)
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
          :absolute 92237441
          :relative 1.1710715485789038
        )
        :calibrates (6355925 6085373)
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
          :absolute 88325294
          :relative 1.2270388418311826
        )
        :calibrates (4354137 6118987)
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
          :absolute 90549653
          :relative 1.1734038160502411
        )
        :calibrates (5995906 6152323)
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
          :absolute 87454665
          :relative 1.1600768167481292
        )
        :calibrates (5904260 6194369)
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
          :absolute 89573124
          :relative 1.2096395809258902
        )
        :calibrates (6681478 4373761)
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
          :absolute 87931320
          :relative 1.2265611639101655
        )
        :calibrates (6095642 4342241)
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
          :absolute 90484099
          :relative 1.1693271503183769
        )
        :calibrates (6074263 6179659)
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
          :absolute 88977611
          :relative 1.3110050397036273
        )
        :calibrates (4310882 4384841)
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
          :absolute 85939927
          :relative 1.2929180824228137
        )
        :calibrates (4305180 4450843)
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
          :absolute 86694810
          :relative 1.1527433312043984
        )
        :calibrates (6034739 6163012)
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
          :absolute 87920448
          :relative 1.2994243178068476
        )
        :calibrates (4444617 4379994)
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
          :absolute 85520276
          :relative 1.2937628281859628
        )
        :calibrates (4321029 4375306)
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
          :absolute 90615307
          :relative 1.303771428868663
        )
        :calibrates (4584627 4419884)
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
          :absolute 90538826
          :relative 1.3139345809642666
        )
        :calibrates (4332195 4456619)
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
          :absolute 86589276
          :relative 1.3007623270355382
        )
        :calibrates (4299958 4364308)
      ))
    :"jpamb.cases.Simple.checkBeforeDivideByN2:(I)I" ((analysis-result
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
          :absolute 87148057
          :relative 1.2882745390414605
        )
        :calibrates (4510232 4464328)
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
          :absolute 88469727
          :relative 1.3084497697128146
        )
        :calibrates (4298991 4398118)
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
          :absolute 87588104
          :relative 1.2715206608413223
        )
        :calibrates (5112953 4261684)
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
          :absolute 91899990
          :relative 1.3255028356547334
        )
        :calibrates (4321398 4365058)
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
          :absolute 87088649
          :relative 1.2247464592780501
        )
        :calibrates (4110186 6270955)
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
          :absolute 85617118
          :relative 1.3073003854654124
        )
        :calibrates (4417760 4021225)
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
          :absolute 89778069
          :relative 1.3075502942087394
        )
        :calibrates (4472969 4371056)
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
          :absolute 92540547
          :relative 1.305095743242943
        )
        :calibrates (4749809 4418016)
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
          :absolute 91269277
          :relative 1.255755449962608
        )
        :calibrates (3950845 6178915)
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
          :absolute 90914713
          :relative 1.3212244041477206
        )
        :calibrates (4312107 4366295)
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
          :absolute 91725327
          :relative 1.3360661571019627
        )
        :calibrates (4320499 4141113)
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
          :absolute 89770482
          :relative 1.239496033902962
        )
        :calibrates (5998039 4345461)
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
          :absolute 87290978
          :relative 1.3004419114307153
        )
        :calibrates (4391579 4349347)
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
          :absolute 90072551
          :relative 1.3173090221565718
        )
        :calibrates (4305872 4370006)
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
          :absolute 86074599
          :relative 1.3095150137694067
        )
        :calibrates (4296105 4144819)
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
          :absolute 91123801
          :relative 1.3197635057359254
        )
        :calibrates (4317846 4409824)
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
          :absolute 96706190
          :relative 1.3441745482441876
        )
        :calibrates (4349252 4406828)
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
          :absolute 85044457
          :relative 1.2921061519529196
        )
        :calibrates (4304364 4376638)
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
          :absolute 86516854
          :relative 1.2914296857593357
        )
        :calibrates (4410387 4434678)
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
          :absolute 92814972
          :relative 1.3485702793571217
        )
        :calibrates (4212668 4106459)
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
          :absolute 87088033
          :relative 1.321627975956003
        )
        :calibrates (4329817 3975582)
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
          :absolute 86862746
          :relative 1.3010973278992868
        )
        :calibrates (4323921 4361007)
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
          :absolute 85896879
          :relative 1.2833194579827205
        )
        :calibrates (4595477 4351739)
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
          :absolute 91620315
          :relative 1.3604368959304396
        )
        :calibrates (3984489 4006212)
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
          :absolute 88673277
          :relative 1.3303144844654227
        )
        :calibrates (4344898 3944219)
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
          :absolute 91631859
          :relative 1.3216556059491467
        )
        :calibrates (4327856 4410322)
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
          :absolute 85647766
          :relative 1.318407258761882
        )
        :calibrates (3870173 4358670)
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
          :absolute 108691077
          :relative 1.3811920605613446
        )
        :calibrates (4390530 4646627)
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
          :absolute 84535032
          :relative 1.2505331457450408
        )
        :calibrates (4356839 5139005)
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
          :absolute 86857306
          :relative 1.322540476848276
        )
        :calibrates (4075682 4190327)
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
          :absolute 92332442
          :relative 1.2919910932998304
        )
        :calibrates (5025052 4402376)
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
          :absolute 88350467
          :relative 1.260172293621813
        )
        :calibrates (4333862 5372725)
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
          :absolute 90025355
          :relative 1.2940626056818703
        )
        :calibrates (4767167 4380961)
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
          :absolute 92765631
          :relative 1.3140584551391987
        )
        :calibrates (4313792 4688615)
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
          :absolute 86723301
          :relative 1.2935537991740627
        )
        :calibrates (4365036 4457877)
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
          :absolute 94547781
          :relative 1.3133659666262263
        )
        :calibrates (4425989 4764008)
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
          :absolute 92062221
          :relative 1.3244060916997262
        )
        :calibrates (4312016 4411777)
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
          :absolute 88939378
          :relative 1.2835016064943665
        )
        :calibrates (4869426 4390819)
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
          :absolute 85785488
          :relative 1.3089529945628464
        )
        :calibrates (4074651 4348815)
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
          :absolute 90211582
          :relative 1.3070858039205442
        )
        :calibrates (4333308 4562932)
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
          :absolute 88107683
          :relative 1.2272532249002182
        )
        :calibrates (4361665 6080500)
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
          :absolute 87583451
          :relative 1.2850739632667334
        )
        :calibrates (4725795 4360317)
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
          :absolute 94087088
          :relative 1.3285688263985755
        )
        :calibrates (4369822 4460798)
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
          :absolute 89175668
          :relative 1.1779534961817917
        )
        :calibrates (7473562 4365652)
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
          :absolute 89856920
          :relative 1.3000220470187323
        )
        :calibrates (4556108 4450463)
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
          :absolute 85861756
          :relative 1.2960724405404462
        )
        :calibrates (4315111 4369639)
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
          :absolute 91572105
          :relative 1.2775829770946159
        )
        :calibrates (5014236 4650950)
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
          :absolute 89541454
          :relative 1.2356971193745483
        )
        :calibrates (4321585 6086169)
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
          :absolute 90040575
          :relative 1.3067642435900102
        )
        :calibrates (4482170 4403783)
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
          :absolute 96215161
          :relative 1.2385561640545064
        )
        :calibrates (4725674 6384410)
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
          :absolute 91194950
          :relative 1.144902307605959
        )
        :calibrates (6678055 6386616)
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
          :absolute 87013440
          :relative 1.2978852246394048
        )
        :calibrates (4366836 4397744)
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
          :absolute 95131244
          :relative 1.2551505853536855
        )
        :calibrates (6176071 4397035)
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
          :absolute 88553305
          :relative 1.2005042691275225
        )
        :calibrates (6646647 4515057)
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
          :absolute 88064002
          :relative 1.3080303764827605
        )
        :calibrates (4327164 4338424)
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
          :absolute 86150957
          :relative 1.2847122815848098
        )
        :calibrates (4555461 4389487)
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
          :absolute 88897815
          :relative 1.2023671487074792
        )
        :calibrates (4533234 6623933)
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
          :absolute 84786096
          :relative 1.2814117236760107
        )
        :calibrates (4316400 4553994)
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
          :absolute 83187852
          :relative 1.1936370586679974
        )
        :calibrates (4318025 6334507)
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
          :absolute 99549209
          :relative 1.2781654460783816
        )
        :calibrates (6106846 4386219)
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
          :absolute 86375261
          :relative 1.282819340480525
        )
        :calibrates (4382759 4624653)
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
          :absolute 88884327
          :relative 1.2294612062849064
        )
        :calibrates (6057072 4423717)
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
          :absolute 91562015
          :relative 1.343017074954391
        )
        :calibrates (4316131 3996304)
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
          :absolute 87532707
          :relative 1.299867468412824
        )
        :calibrates (4422050 4354683)
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
          :absolute 89111226
          :relative 1.3088413106610282
        )
        :calibrates (4347902 4404376)
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
          :absolute 87203459
          :relative 1.3114449567759041
        )
        :calibrates (4153101 4360607)
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
          :absolute 91100179
          :relative 1.3195453298392492
        )
        :calibrates (4354311 4375481)
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
          :absolute 89285214
          :relative 1.2280355811225099
        )
        :calibrates (4324216 6238460)
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
          :absolute 86246950
          :relative 1.2771008861185873
        )
        :calibrates (4323275 4789966)
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
          :absolute 84404516
          :relative 1.2886323574415022
        )
        :calibrates (4316366 4368504)
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
          :absolute 85794620
          :relative 1.2207294356996663
        )
        :calibrates (5914293 4407630)
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
          :absolute 86027325
          :relative 1.320977969212857
        )
        :calibrates (3864960 4351570)
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
          :absolute 86154369
          :relative 1.28698537233472
        )
        :calibrates (4356029 4542576)
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
          :absolute 88423282
          :relative 1.3094903780296387
        )
        :calibrates (4306754 4364986)
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
          :absolute 86565617
          :relative 1.2015221749955358
        )
        :calibrates (4712874 6172748)
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
          :absolute 84266567
          :relative 1.287084184982018
        )
        :calibrates (4340623 4361017)
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
          :absolute 90560287
          :relative 1.3147847084132551
        )
        :calibrates (4343131 4430575)
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
          :absolute 87617956
          :relative 1.2057977256630803
        )
        :calibrates (6414805 4495211)
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
          :absolute 94929096
          :relative 1.3364444673286797
        )
        :calibrates (4315462 4434071)
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
          :absolute 84652633
          :relative 1.2886060423305787
        )
        :calibrates (4340244 4370684)
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
          :absolute 87863631
          :relative 1.3048925446330473
        )
        :calibrates (4316254 4392311)
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
          :absolute 94341209
          :relative 1.3262912659726707
        )
        :calibrates (4295887 4605141)
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
          :absolute 87760030
          :relative 1.300220259596605
        )
        :calibrates (4354816 4437565)
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
          :absolute 86445355
          :relative 1.2966928965527031
        )
        :calibrates (4354013 4377284)
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
          :absolute 85916232
          :relative 1.2687718273518642
        )
        :calibrates (4380248 4873835)
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
          :absolute 82778634
          :relative 1.1978533076138773
        )
        :calibrates (4570871 5926848)
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
          :absolute 88763795
          :relative 1.318943058707458
        )
        :calibrates (3959154 4558555)
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
          :absolute 88743376
          :relative 1.3073669961753522
        )
        :calibrates (4311142 4434646)
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
          :absolute 88933350
          :relative 1.1578017023253295
        )
        :calibrates (6133982 6233832)
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
          :absolute 85442981
          :relative 1.3113559832095245
        )
        :calibrates (4382861 3960680)
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
          :absolute 90385573
          :relative 1.3265131329106674
        )
        :calibrates (4316284 4207177)
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
          :absolute 90688581
          :relative 1.1342227749683844
        )
        :calibrates (6722335 6593237)
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
          :absolute 76914794
          :relative 1.2915977161999947
        )
        :calibrates (3917776 3942579)
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
          :absolute 100673061
          :relative 1.352667207088936
        )
        :calibrates (4532387 4406348)
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
          :absolute 89926295
          :relative 1.1494967179370477
        )
        :calibrates (6072637 6674715)
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
          :absolute 78593249
          :relative 1.2885105241195671
        )
        :calibrates (3927535 4161649)
      ))
  )
)