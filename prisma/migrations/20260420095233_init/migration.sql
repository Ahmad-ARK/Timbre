/*
  Warnings:

  - You are about to drop the `VOICE` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Generation" DROP CONSTRAINT "Generation_voiceId_fkey";

-- DropTable
DROP TABLE "VOICE";

-- CreateTable
CREATE TABLE "Voice" (
    "id" TEXT NOT NULL,
    "orgId" TEXT,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "category" "VoiceCategory" NOT NULL DEFAULT 'GENERAL',
    "language" TEXT NOT NULL DEFAULT 'en-US',
    "variant" "VoiceVariant" NOT NULL,
    "r2ObjectKey" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Voice_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "Voice_variant_idx" ON "Voice"("variant");

-- CreateIndex
CREATE INDEX "Voice_orgId_idx" ON "Voice"("orgId");

-- AddForeignKey
ALTER TABLE "Generation" ADD CONSTRAINT "Generation_voiceId_fkey" FOREIGN KEY ("voiceId") REFERENCES "Voice"("id") ON DELETE SET NULL ON UPDATE CASCADE;
