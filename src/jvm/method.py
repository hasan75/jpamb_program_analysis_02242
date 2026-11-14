from dataclasses import dataclass, field

import jvm.classfile
import jvm.opcode


@dataclass(frozen=True)
class Method:
    """A java method, (still) partial"""

    id: jvm.classfile.AbsMethodID
    opcodes: list[jvm.opcode.Opcode]
    max_locals: int
    lines: list[dict[str, int]] = field(default_factory=list)

    @classmethod
    def from_json(cls, id: jvm.classfile.AbsMethodID, json) -> "Method":
        opcodes = [jvm.opcode.Opcode.from_json(op) for op in json["code"]["bytecode"]]
        max_locals = json["code"]["max_locals"]
        lines = json["code"].get("lines", [])

        return Method(
            id=id,
            opcodes=opcodes,
            max_locals=max_locals,
            lines=lines,
        )
